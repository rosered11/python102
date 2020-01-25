
cd $CONDA_PREFIX

rm -rf ./etc/conda/activate.d || true
rm -rf ./etc/conda/deactivate.d || true
mkdir -p ./etc/conda/activate.d
mkdir -p ./etc/conda/deactivate.d

touch ./etc/conda/activate.d/env_vars.bat
touch ./etc/conda/deactivate.d/env_vars.bat
echo '#!/bin/sh' >> ./etc/conda/activate.d/env_vars.bat
echo export SECRET_KEY=\'%5l\$psqo^pd3#\$chzs9l_y6\$j3otm41dr\*f\&sxcquay7^c2oh#\' >> ./etc/conda/activate.d/env_vars.bat
echo '#!/bin/sh' >> ./etc/conda/deactivate.d/env_vars.bat
echo unset SECRET_KEY= >> ./etc/conda/deactivate.d/env_vars.bat

echo $SECRET_KEY