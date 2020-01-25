#!/bin/sh
cd $CONDA_PREFIX

rm -rf ./etc/conda/activate.d || true
rm -rf ./etc/conda/deactivate.d || true
mkdir -p ./etc/conda/activate.d
mkdir -p ./etc/conda/deactivate.d

touch ./etc/conda/activate.d/env_vars.sh
touch ./etc/conda/deactivate.d/env_vars.sh
echo '#!/bin/sh' >> ./etc/conda/activate.d/env_vars.sh
echo '#!/bin/sh' >> ./etc/conda/deactivate.d/env_vars.sh

# Set Environment of Secret Key
echo export SECRET_KEY=\'%5l\$psqo^pd3#\$chzs9l_y6\$j3otm41dr\*f\&sxcquay7^c2oh#\' >> ./etc/conda/activate.d/env_vars.sh

# Set Environment of postgres
if [[ $1 == 'postgres' ]]
then
    echo export DATABASE_ENGINE='django.db.backends.postgresql' >> ./etc/conda/activate.d/env_vars.sh
    echo export DATABASE_NAME='postgres' >> ./etc/conda/activate.d/env_vars.sh
    echo export DATABASE_USER='sa' >> ./etc/conda/activate.d/env_vars.sh
    echo export DATABASE_PASSWORD='pass@word1' >> ./etc/conda/activate.d/env_vars.sh
    echo export DATABASE_HOST='127.0.0.1' >> ./etc/conda/activate.d/env_vars.sh
    echo export DATABASE_PORT='31543' >> ./etc/conda/activate.d/env_vars.sh
    
    echo unset DATABASE_USER >> ./etc/conda/deactivate.d/env_vars.sh
    echo unset DATABASE_PASSWORD >> ./etc/conda/deactivate.d/env_vars.sh
    echo unset DATABASE_HOST >> ./etc/conda/deactivate.d/env_vars.sh
    echo unset DATABASE_PORT >> ./etc/conda/deactivate.d/env_vars.sh

# Set Environment of sqlite
else
    echo export DATABASE_ENGINE='django.db.backends.sqlite3' >> ./etc/conda/activate.d/env_vars.sh
    echo export DATABASE_NAME=\'os.path.join\(BASE_DIR, \'db.sqlite3\'\)\' >> ./etc/conda/activate.d/env_vars.sh
fi

echo unset SECRET_KEY >> ./etc/conda/deactivate.d/env_vars.sh
echo unset DATABASE_ENGINE >> ./etc/conda/deactivate.d/env_vars.sh
echo unset DATABASE_NAME >> ./etc/conda/deactivate.d/env_vars.sh

