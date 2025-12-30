return {
  fzf_bin = "sk",
  previewers = {
    bat = {
      cmd = "bat",
      args = "--color=always --line-range=:200 --paging=never --style=plain",
    },
  },
  files = {
    previewer = false,
    -- previewer = "bat",
    file_icons = false,
  },
  buffers = {
    previewer = false,
    file_icons = false,
  },
}
