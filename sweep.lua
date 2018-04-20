include "map_builder.lua"
include "trajectory_builder.lua"

options = {
  map_builder = MAP_BUILDER,
  trajectory_builder = TRAJECTORY_BUILDER,
  map_frame = "map",
  tracking_frame = "base_link",
  published_frame = "base_link",
  odom_frame = "odom",
  provide_odom_frame = true,
  use_odometry = false,
  num_laser_scans = 1,
  num_multi_echo_laser_scans = 0,
  num_point_clouds = 0,
  num_subdivisions_per_laser_scan = 1,
  lookup_transform_timeout_sec = 0.2,
  submap_publish_period_sec = 0.5,
  pose_publish_period_sec = 0.1,
  trajectory_publish_period_sec = 0.1,
}

MAP_BUILDER.use_trajectory_builder_2d = true
MAP_BUILDER.num_background_threads = 7

TRAJECTORY_BUILDER_2D.scans_per_accumulation = 1
TRAJECTORY_BUILDER_2D.use_online_correlative_scan_matching = true
TRAJECTORY_BUILDER_2D.use_imu_data = false

--TRAJECTORY_BUILDER_2D.submaps.resolution = 0.1
--TRAJECTORY_BUILDER_2D.submaps.output_debug_images = true

SPARSE_POSE_GRAPH.optimize_every_n_scans = 300
SPARSE_POSE_GRAPH.constraint_builder.min_score = 0.65
SPARSE_POSE_GRAPH.constraint_builder.global_localization_min_score = 0.7

return options