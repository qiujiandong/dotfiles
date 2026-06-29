# Mail

The mail stack is designed for a plain-text, local-first workflow with Gmail as
the current backing account.

## Components

- `neomutt` is the mail client
- `mbsync` synchronizes Maildir state
- `msmtp` sends mail
- `w3m` handles HTML mail viewing when needed

## neomutt Behavior

The current `neomuttrc` is tuned for:

- Maildir storage
- plain-text composition
- kernel mailing list friendly replies
- a visible sidebar for mailbox navigation
- external syncing through `mbsync`

The configuration explicitly avoids `format=flowed`, keeps quoting simple, and
uses `nvim` as the editor.

## Operational Flow

- Incoming and stored mail lives under `~/Mail/Gmail`
- `mbsync` updates local mailboxes
- `msmtp` handles outbound delivery
- neomutt macros provide direct sync and raw message viewing shortcuts

## Customization Notes

The first things to review when adapting this setup are:

- account names and mailbox paths
- SMTP and OAuth-related settings
- sidebar layout
- reply behavior for mailing-list workflows
