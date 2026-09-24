// Delete the current session and open the session list in one step.
// Keybind: <leader>w (ctrl+x then w). Slash command: /close.
import type { TuiPlugin, TuiPluginModule } from "@opencode-ai/plugin/tui"

const COMMAND = "session.close"

const tui: TuiPlugin = async (api) => {
  api.keymap.registerLayer({
    commands: [
      {
        name: COMMAND,
        title: "Delete session and open session list",
        category: "Session",
        namespace: "palette",
        slashName: "close",
        async run() {
          const route = api.route.current
          if (route.name !== "session" || !route.params?.sessionID) {
            api.keymap.dispatchCommand("session.list")
            return
          }
          const sessionID = route.params.sessionID as string

          // Stop a running response before the delete.
          if (api.state.session.status(sessionID)?.type === "busy") {
            await api.client.session.abort({ sessionID }).catch(() => undefined)
          }

          api.route.navigate("home")
          const result = await api.client.session.delete({ sessionID }).catch((error) => ({ error }))
          if (result?.error) {
            api.ui.toast({ variant: "error", title: "Session delete failed", message: String(result.error) })
          }
          api.keymap.dispatchCommand("session.list")
        },
      },
    ],
    bindings: [{ key: "<leader>w", cmd: COMMAND }],
  })
}

export default { id: "caio.session-close", tui } satisfies TuiPluginModule
