#!/bin/sh
set -e
npx tsx db/migrate.ts
npx tsx db/seed.ts
if [ -n "$ADMIN_PASSWORD" ]; then
  ROTATE_OPERATOR_ID=op_AL ROTATE_NEW_PASSWORD="$ADMIN_PASSWORD" npx tsx scripts/rotate-op-password.ts
fi
exec npx tsx server/index.ts
