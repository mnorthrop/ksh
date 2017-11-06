#!/usr/bin/ksh

# Backup current key
cp /epic/$1/cachesys/mgr/cache.key /epic/$1/cachesys/mgr/cache.key.old

# Copy in staged new key
cp -p /staged/key/location/new_cache.key /epic/$1/cachesys/mgr/cache.key

# Run Intersystems Caché utility to Upgrade License
echo 'd $System.License.Upgrade()\n\nh\n' | csession $1 -U %SYS

# Display completion message
echo "Instance $1 completed."
