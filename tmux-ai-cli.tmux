#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Default key bindings
tmux_ai_claude_key="@tmux_ai_claude_key"
tmux_ai_gemini_key="@tmux_ai_gemini_key"

# Get user-defined key bindings or use defaults
claude_key=$(tmux show-option -gqv "$tmux_ai_claude_key")
gemini_key=$(tmux show-option -gqv "$tmux_ai_gemini_key")

# Set default values if not configured
claude_key=${claude_key:-"u"}
gemini_key=${gemini_key:-"j"}

# Bind keys to launch AI sessions
tmux bind-key "$claude_key" run-shell "zsh -c '$CURRENT_DIR/scripts/launch_claude_session \"#{pane_current_path}\"'"
tmux bind-key "$gemini_key" run-shell "zsh -c '$CURRENT_DIR/scripts/launch_gemini_session \"#{pane_current_path}\"'"