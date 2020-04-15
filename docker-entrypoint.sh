#!/bin/bash

while ! PGPASSWORD=gnaf psql -h db -U gnaf -l >/dev/null; do
  echo "** Waiting for PostgreSQL to start up and be ready for queries. **"
  sleep 5
done

echo "** Launching loader **"
python load-gnaf.py --gnaf-tables-path /data/feb20_gnaf_pipeseparatedvalue_gda2020/ --admin-bdys-path /data/feb20_adminbounds_esrishapefileordbffile_gda2020/ --pghost db --pgdb gnaf --pguser gnaf --pgpassword gnaf
