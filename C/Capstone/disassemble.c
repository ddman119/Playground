#include <stdio.h>
#include <inttypes.h>

#include <capstone/capstone.h>

#define CODE "\x55\x48\x89\xe5\x48\x83\xec\x07"

int main(void) {
  csh handle;
  cs_insn *insn;
  size_t count = 0;

  if (cs_open(CS_ARCH_X86, CS_MODE_64, &handle) != CS_ERR_OK) {
    return 1;
  }

  cs_option(handle, CS_OPT_SYNTAX, CS_OPT_SYNTAX_ATT);
  count = cs_disasm(handle, CODE, sizeof(CODE) - 1, 0x100, 0, &insn);

  if (count > 0) {
    size_t j;
    for (j = 0; j < count; j++) {
      printf("0x%"PRIx64":\t%s\t\t%s\n", insn[j].address, insn[j].mnemonic, insn[j].op_str);
    }

    cs_free(insn, count);
  }
  else {
    printf("Failed to disassemble!\n");
  }

  cs_close(&handle);

  return 0;
}
