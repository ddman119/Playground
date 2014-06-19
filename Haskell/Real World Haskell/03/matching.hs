type Name = String
type PhoneNumber = String

data Contact = Contact Name PhoneNumber

phoneNumber :: Contact -> PhoneNumber
phoneNumber (Contact name number) = number
