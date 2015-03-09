#include <stdio.h>
#include <assert.h>
#include <unistd.h>
#include <sys/types.h>

struct block_meta {
  size_t size;
  struct block_meta *next;
  int free;
};

#define META_SIZE sizeof(struct block_meta)

void *custom_malloc(size_t size);
void custom_free(void *ptr);
struct block_meta *get_block_ptr(void *ptr);
struct block_meta *find_free_block(struct block_meta **last_block, size_t size);
struct block_meta *request_space(struct block_meta *last, size_t size);

int main() {
  void *top = sbrk(0);

  printf("Metablock size: %d\n", META_SIZE);

  void *requested = custom_malloc(128);
  printf("Requested memory: %p\n", requested);
  custom_free(requested);

  void *new_top = sbrk(0);

  printf("Previous top: %p, new top: %p\n", top, new_top);

  return 0;
}

void *global_base = NULL;

// A dead-simple implementation of malloc.
// This uses sbrk() to increase the heap size, and then returns the pointer
// to the new top of the heap.
void *custom_malloc(size_t size) {
  struct block_meta *block;

  if (size <= 0) {
    return NULL;
  }

  if (!global_base) {
    block = request_space(NULL, size);

    if (!block) {
      return NULL;
    }

    global_base = block;
  }
  else {
    struct block_meta *last = global_base;
    block = find_free_block(&last, size);

    if (!block) {
      // Failed to find a free block.
      block = request_space(last, size);

      if (!block) {
        return NULL;
      }
    }
    else {
      // Here, we have found a block with the right size.
      // It could be worthwhile to split the block up so that we don't waste
      // any room for any future calls to malloc.
      block->free = 0;
    }
  }

  return (block + 1);
}

void *custom_calloc(size_t elements, size_t element_size) {
  size_t size = elements * element_size;
  void *ptr = custom_malloc(size);
  memset(ptr, 0, size);

  return ptr;
}

struct block_meta *get_block_ptr(void *ptr) {
  return (struct block_meta *)ptr - 1;
}

struct block_meta *find_free_block(struct block_meta **last_block, size_t size) {
  struct block_meta *current = global_base;

  while (current && !(current->free && current->size >= size)) {
    // Keep track of the last block, so that if there aren't any suitable blocks
    // then we can expand the heap from the last block in the list.
    *last_block = current;
    current = current->next;
  }

  return current;
}

struct block_meta *request_space(struct block_meta *last, size_t size) {
  struct block_meta *block = sbrk(0);
  void *requested_memory = sbrk(size + META_SIZE);

  if (requested_memory == (void *)-1) {
    return NULL;
  }

  if (last) {
    last->next = block;
  }

  block->size = size;
  block->next = NULL;
  block->free = 0;

  return block;
}

// An equally dead-simple implementation of free.
// The idea here is to take a pointer previously allocated by malloc, and then
// mark its memory as freed, so future malloc calls can reuse it.
void custom_free(void *ptr) {
  if (!ptr) {
    return;
  }

  struct block_meta *block_ptr = get_block_ptr(ptr);
  assert(block_ptr->free == 0);
  block_ptr->free = 1;
}
