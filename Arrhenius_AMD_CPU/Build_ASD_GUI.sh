# Build instructions for UppASD ASD_GUI on Arrhenius AMD nodes

# Load Cray Python, create venv and install dependencies
ml Python/3.13.5-bare-gcc-2025b-eb
python -m venv asd_gui_env
. asd_gui_env/bin/activate
pip install -r requirements.txt
#pip install numpy matplotlib pyyaml pandas pyqt6 pyqt6-qt6 vtk seekpath spglib tabulate

# Install the ASD_GUI
cd ASD_GUI
pip install .

# To use the ASD_GUI
#. asd_gui_env/bin/activate
#asd_gui
