# Build instructions for UppASD ASD_GUI on Dardel AMD nodes

# Load Cray Python, create venv and install dependencies
ml cray-python/3.12.12
python -m venv asd_gui_env
. asd_gui_env/bin/activate
pip install -r requirements.txt
#pip install numpy matplotlib pyyaml pandas pyqt6 pyqt6-qt6 vtk seekpath spglib tabulate

# Install the ASD_GUI
cd ASD_GUI
pip install .

# To use the ASD_GUI
#ml qt/6.7.2
#. asd_gui_env/bin/activate
#asd_gui
