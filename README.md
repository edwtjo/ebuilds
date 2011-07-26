# Usage

To add this repository install layman:

        emerge layman

Source the added portage overlays:

        echo source /var/lib/layman/make.conf >> /etc/make.conf

And run:

        layman -o https://github.com/edwtjo/ebuilds/raw/master/overlay.xml -f -a edwtjo-ebuilds 

