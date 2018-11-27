FS_IMU ='C:\Users\disam\OneDrive - Universidad Politécnica de Madrid\ExoFlex\Publications\Access\Tests\dataAcquired\test2\Match\IMU_FS_21T123250.mat';
T_s = struct2cell(load(FS_IMU));
T_s = T_s{1};
OPT = 'C:\Users\disam\OneDrive - Universidad Politécnica de Madrid\ExoFlex\Publications\Access\Tests\dataAcquired\test2\OptiTrack\mat\20181121 122830.mat';
T_i = struct2cell(load(OPT));
T_i = T_i{1};

