#!/bin/bash

# Print status function
print_status() {
    echo "===> $1"
}

print_status "Starting WebDAV mount permissions fix..."

# 1. Ensure davfs2 group exists
print_status "Creating davfs2 group if not exists..."
sudo groupadd davfs2 2>/dev/null

# 2. Add current user to davfs2 group
print_status "Adding current user to davfs2 group..."
sudo usermod -aG davfs2 $USER

# 3. Create and fix mount point directories
print_status "Creating and fixing mount point directories..."
sudo mkdir -p /mnt/webdav/tsdrive /mnt/webdav/alist

# 4. Set correct permissions for mount points
print_status "Setting mount point permissions..."
sudo chown root:davfs2 /mnt/webdav/tsdrive
sudo chmod 775 /mnt/webdav/tsdrive
sudo chown root:davfs2 /mnt/webdav/alist
sudo chmod 775 /mnt/webdav/alist
sudo chown root:davfs2 /mnt/webdav
sudo chmod 775 /mnt/webdav

# 5. Fix davfs2 configuration permissions
print_status "Setting davfs2 configuration permissions..."
sudo chown root:davfs2 /etc/davfs2
sudo chmod 755 /etc/davfs2
sudo chown root:davfs2 /etc/davfs2/secrets
sudo chmod 600 /etc/davfs2/secrets

# 6. Refresh group membership
#!/bin/bash

# Print status function
print_status() {
    echo "===> $1"
}

print_status "Starting WebDAV and NFS mount permissions fix..."

# 1. Ensure davfs2 group exists
print_status "Creating davfs2 group if not exists..."
sudo groupadd davfs2 2>/dev/null

# 2. Add current user to davfs2 group
print_status "Adding current user to davfs2 group..."
sudo usermod -aG davfs2 $USER

# 3. Create and fix mount point directories
print_status "Creating and fixing mount point directories..."
sudo mkdir -p /mnt/webdav/tsdrive /mnt/webdav/alist /mnt/nfs_fstab

# 4. Set correct permissions for WebDAV mount points
print_status "Setting WebDAV mount point permissions..."
sudo chown root:davfs2 /mnt/webdav/tsdrive
sudo chmod 775 /mnt/webdav/tsdrive
sudo chown root:davfs2 /mnt/webdav/alist
sudo chmod 775 /mnt/webdav/alist
sudo chown root:davfs2 /mnt/webdav
sudo chmod 775 /mnt/webdav

# 5. Set correct permissions for NFS mount point
print_status "Setting NFS mount point permissions..."
sudo chown root:root /mnt/nfs_fstab
sudo chmod 777 /mnt/nfs_fstab

# 6. Fix davfs2 configuration permissions
print_status "Setting davfs2 configuration permissions..."
sudo chown root:davfs2 /etc/davfs2
sudo chmod 755 /etc/davfs2
sudo chown root:davfs2 /etc/davfs2/secrets
sudo chmod 600 /etc/davfs2/secrets

# 7. Refresh group membership
print_status "Refreshing group membership..."
newgrp davfs2

# 8. Final mount attempt
print_status "Attempting to mount all shares..."
sudo mount -a

print_status "Script completed! If you still see errors, please log out and log back in"
print_status "Current group membership:"
groups $USER
