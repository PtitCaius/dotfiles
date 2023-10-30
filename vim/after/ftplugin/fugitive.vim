lua << EOF

local wk =  require("which-key")
wk.register({
  ["g?"]="open fugitive help",
  ["s"] = "Stage the file or hunk under the cursor",
  ["u"] = "Unstage the file or hunk under the cursor",
  ["-"] = "Stage or unstage the file or the hunk",
  ["U"] = "Unstage everything",
  ["X"] = "Discard the change under the cursor",
  ["="] = "Toggle an inline diff",
  [">"] = "show the inline diff",
  ["<"] = "Hide the inline diff",
  ["gI"] = "Insert the file in gitignore (count)",
  ["I"] = "git add --patch file",
  ["P"] = "git reset --patch file",
  ["d"] = 
  {
    name = "Diff",
    ["p"] = "which_key_ignore",
    ["d"] = "Gitdiffsplit the file",
    ["v"] = "Gitvdiffsplit the file",
    ["s"] = "Ghdiffsplit the file",
    ["h"] = "which_key_ignore",
    ["q"] = "Close all diff windoww",
    ["?"] = "show the diff help",
  },
  ["<CR>"] = "Open the file under cursor",
  ["o"] = "Open the file in a new split",
  ["gO"] = "Open the file in a new vertical split",
  ["O"] = "Open the file in a new tab",
  ["1p"] = "Open the file in a preview",
  --["~"] = "Open the current file in the [count]th previous ancestor",
  ["~"] = "which_key_ignore",
  --["P"] = "Open the current file in the [count]th parent." ,
  ["C"] = "Open the commit containing the current file",
  ["("] = "jump to the next file, hunk, or revision",
  [")"] = "jump to the previous file, hunk, or revision",
  ["i"] = "jump to the next file or hunk, expanding diff",
  ["]"] =
  {
    name = "jumps",
    ["c"] = "next hunk, expanding diff",
    ["m"] = "next file",
    ["/"] = "which_key_ignore",
    ["]"] = "[count] next sections",
    ["["] = "[count] next section end"
  },
  ["["] =
  {
    name = "jumps",
    ["c"] = "previous hunk, expanding diff",
    ["m"] = "previous file",
    ["/"] = "which_key_ignore",
    ["["] = "[count] previous sections",
    ["]"] = "[count] previous section end"
  },
  ["*"] = "search for the + or - corresponding line",
  ["#"] = "search backward for the + or - corresponding line",
  g =
  {
    ["u"] = "jump to [count] untracked file",
    ["U"] = "Jump to [count] unstaged file",
    ["s"] = "Jump to [count] staged file",
    ["p"] = "Jump to [count] unpushed file",
    ["P"] = "Jump to [count] unpulled file",
    ["r"] = "Jump to [count] rebasing file",
    ["i"] = "open .git/info/exclude or .gitignore",
    ["c"] = "open commit in preview",
    ["C"] = "which_key_ignore"
  },
  ["c"] =
  {
    name = "Commits/stashs/checkout",
    ["c"] = "Create a commit",
    ["a"] = "Amend the last commit and edit the message",
    ["e"] = "Amend the commit",
    ["w"] = "Reword the last commit",
    ["v"] = 
    {
        name = "Verbose",
        ["c"] = "Create a commit",
        ["a"] = "Amend the last commit"
    },
    ["f"] = "fixup commit",
    ["F"] = "Fixup commit + rebase",
    ["s"] = "Squash commit",
    ["S"] = "Squash commit + rebase",
    ["A"] = "Squash commit + edit",
    ["c "] = ":Git Commit",
    ["r"] =
    {
      name = "Revert",
      ["c"] = "Revert commit",
      ["n"] = "Revert commit, w/o commiting",
      [" "] = ":Git revert ",
    },
    ["m"] = ":Git merge ",
    ["?"] = "show commit help",
    ["o"] = 
    {
      name = "Checkout",
      ["o"] = "Checkout commit",
      [" "] = ":Git checkout ",
      ["?"] = "Show checkout help"
    },
    ["b"] =
    {
      name = "Branch",
      [" "] = ":Git branch ",
      ["?"] = "Show checkout help"
    },
    ["z"] = 
    {
      name = "Stash",
      ["z"] = "Push stash",
      ["w"] = "Push stash of worktree",
      ["A"] = "Apply stash@[count]",
      ["a"] = "Apply stash@[count], keep index",
      ["P"] = "Pop stash@[count]",
      ["p"] = "Pop stash@[count], keep index",
      [" "] = ":Git stash",
      ["?"] = "show stash help",
    },
  },
  ["r"] =
  {
    name = "Rebase",
    ["i"] = "Interactive rebase",
    ["f"] = "Autosquash rebase",
    ["u"] = "Rebase against @{upstream}",
    ["p"] = "Rebase against @{push}",
    ["r"] = "Continue rebasing",
    ["s"] = "Skip current commit",
    ["a"] = "Abort rebase",
    ["e"] = "edit Todo list",
    ["w"] = "i rebase w/ commit to reword",
    ["m"] = "i rebase w/ commit to edit",
    ["d"] = "i rebase w/ commit to drop",
    [" "] = ":Git rebase",
    ["?"] = "show rebase help"
  },
  ["gq"] = "Close the status buffer",
  ["."] = "Command w/ file populated",
},
{
  buffer=0,
  mode = "n"
})
EOF
