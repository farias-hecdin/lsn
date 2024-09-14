import pkg/cmdos

# Creating commands that does not accept options
const helpCmd* = CmdosCmd(
  names: @["-h", "--help"],
  desc: "Display this help message and exit."
)

# Creating commands that accepts options
const optCmd* = CmdosCmd(
  names: @[""],
  opts: @[
    CmdosOpt(names: @[""], inputs: @["./"], label: "<path>", noDefault: true),
    CmdosOpt(names: @["-a", "--showHidden"]),
    CmdosOpt(names: @["-l", "--showList"]),
    CmdosOpt(names: @["-m", "--showMeta"]),
    CmdosOpt(names: @["-d", "--showDirsOnly"]),
    CmdosOpt(names: @["-f", "--showFilesOnly"]),
  ]
)

# Generate help message
const cliSetup = Cmdos(
  name: "lsn",
  cmds: @[optCmd, helpCmd]
)

const helpMsg* = processHelp(cliSetup)
