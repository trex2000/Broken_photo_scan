This is a simple script that will scan a folder (recursively) for broken image files and will move them out to a separate folder for review (before manually deleting it)
It uses the identify CLI from Imagemagick, therefore it must be installed from your distro-s own repository first.
You can automate it with a CRON job do perform periodically check.
Why is it useful ?
Plex, Kodi or other photo indexing application might hang if it encounters invalid image files. Or simply put, why keep broken image files, they will just take up valuable disk space.


Note:
Edit the 
