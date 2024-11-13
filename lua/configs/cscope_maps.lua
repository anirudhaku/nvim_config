return {
  -- Don't prompt when invoked through shortcuts!
  skip_input_prompt = true,
  cscope = {
    picker = "telescope",
    db_build_cmd_args = {
      "-bq",
    },
  },
}
