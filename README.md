# Usage

To add this repository use layman, i.e.

        emerge layman

As root, verify that the list of sources of repositories in /etc/layman/layman.cfg
contains the latter file:// entry, i.e.

        overlays : http://http://www.gentoo.org/proj/en/overlays/layman-global.txt
                   file:///usr/local/portage/layman/own.xml

and add this repository as an entry in /usr/local/portage/layman/own.xml, i.e.
        <overlay contact="e __at__ cube2 __dot__ se" name="edwtjo-ebuilds" src="git://github.com/edwtjo/ebuilds" status="unofficial" type="git">
        <link>git://github.com/edwtjo/ebuilds</link>
        <description>Providing assorted non official ebuilds</description>
        </overlay>

Done
