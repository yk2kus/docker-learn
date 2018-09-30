# get addons path
addons_path=`ls -d /mnt/extra-addons/* | paste -d, -s`
echo $addons_path
# can't use / because directory name contains, using #
sed -i -e "s#__addons__path__#${addons_path}#" /etc/odoo/odoo.cfg