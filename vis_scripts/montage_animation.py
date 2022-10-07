import sys
sys.path.append('/groups/elferich/deco_lace_template_matching_manuscript/content/code')
import assemble_montage_utils
from pathlib import Path
import starfile
import numpy as np


input_directory = Path("/scratch/bern/elferich/deco_lace_manuscript_processing/refined_assembly_it2/")
output_directory = Path("/groups/elferich/Documents/ohsu_seminar/vis_scripts")
montage_data = starfile.read(input_directory/f"fff_lamella4_t2.star")
tile_datao = montage_data["tiles"]

for i in [2]:
    s = 50
    tile_data = tile_datao[s:s+i].copy()
    name = "test"
    binning = 10
    max_image_x = np.max(tile_data.loc[:,"tile_x_size"]/binning)
    max_image_y = np.max(tile_data.loc[:,"tile_y_size"]/binning)
    min_shift_x = np.min(tile_data.loc[:,"tile_x_offset"]/tile_data.loc[:,"tile_pixel_size"]/binning) - 2 * binning
    min_shift_y = np.min(tile_data.loc[:,"tile_y_offset"]/tile_data.loc[:,"tile_pixel_size"]/binning) - 2 * binning
    max_shift_x = np.max(tile_data.loc[:,"tile_x_offset"]/tile_data.loc[:,"tile_pixel_size"]/binning) + max_image_x + 2 * binning
    max_shift_y = np.max(tile_data.loc[:,"tile_y_offset"]/tile_data.loc[:,"tile_pixel_size"]/binning) + max_image_y + 2 * binning
    # Correct tile shift
    tile_data["tile_x_offset"] -= min_shift_x * tile_data["tile_pixel_size"] * binning
    tile_data["tile_y_offset"] -= min_shift_y * tile_data["tile_pixel_size"] * binning
    tile_data["tile_x_offset"] += np.array([-10,22])
    tile_data["tile_y_offset"] += np.array([-80,20])
    # Decide on dimensions of montage

    montage_y_size = int(max_shift_y-min_shift_y)
    montage_x_size = int(max_shift_x-min_shift_x)
    montage_pixel_size = tile_data['tile_pixel_size'].iloc[0] * binning


    montage_data["montage"].loc[0] =  {
            'montage_filename': str(output_directory/f"{name}") + f"_montage{i:0>4}.tif",
            'matches_montage_filename': str(output_directory/f"{name}")+f"_matches_montage{i:0>4}.tif",
            'montage_pixel_size': montage_pixel_size,
            'montage_binning': binning,
            'montage_x_size': montage_x_size,
            'montage_y_size': montage_y_size,
        }
    results = {
            "montage": montage_data["montage"],
            "tiles": tile_data
        }


    erode_mask = 50
    gain = "/scratch/bern/elferich/deco_lace_manuscript_processing/averages/fff_gain.mrc"

    assemble_montage_utils.create_montage_bin_after(results,erode_mask=erode_mask+50,gain=gain,blend=True,gain_mult=0.5)