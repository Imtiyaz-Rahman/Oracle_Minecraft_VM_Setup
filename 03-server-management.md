# Server Management

## Tmux Sessions

Tmux session management keeps your server running after disconnecting from SSH.
Tmux is downloaded with the `setup script`. But run the session commands `manually`.

Create session:

```bash
tmux new-session -s minecraft
```

Reconnect:

```bash
tmux attach
```

Detach: `Ctrl+B` then `D`

## Java Version

Check version:

```bash
java -version
```

List versions:

```bash
update-java-alternatives --list
```

Switch version:

```bash
sudo update-java-alternatives --set /path/to/java/version
```

**Note:** Java 1.18 works for RLCraft and BerkIsland

## Server Operations

Start (in tmux):

```bash
./server_setup.sh
```

Stop: Type `stop` or press `Ctrl+C`
