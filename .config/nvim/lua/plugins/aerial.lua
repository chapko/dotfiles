return {
  {
    "stevearc/aerial.nvim",
    opts = {
      -- Available kinds:
      --
      -- Array Boolean Class Constant Constructor Enum EnumMember Event Field File
      -- Function Interface Key Method Module Namespace Null Number Object Operator
      -- Package Property String Struct TypeParameter Variable
      filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Module",
        "Method",
        "Struct",
      },
    },
  },
}
