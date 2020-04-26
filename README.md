# Exact geodesic for triangular meshes

This is an implementation of geodesic (shortest path) algorithm for triangular meshes, written by Danil Kirsanov. The C++ code is hosted on [Google Code](https://code.google.com/archive/p/geodesic/) and the Matlab interface is from [Matlab File Exchange](https://mathworks.com/matlabcentral/fileexchange/18168-exact-geodesic-for-triangular-meshes).

The code and compiled Windows dynamic-link libraries are originally released on 2008, which are quite old and do not work on modern PCs. The maintainer of this repository modified the code to make it easy to use, following Fritz and Dean Mark's [comments](https://mathworks.com/matlabcentral/fileexchange/18168-exact-geodesic-for-triangular-meshes).

For algorithm details, please refer to [readme](./src/#readme).

<img src="https://github.com/zishun/geodesic_matlab/raw/master/example2.png" width="500"/>

## Build

![](https://img.shields.io/badge/build-passing-brightgreen)

1. Build the shared library (`.dll` or `.so`)

```
    mkdir build
    cd build
    cmake ..
    cmake --build . --config Release
```  
2. Add folder containing ```geodesic_(debug|release).dll``` to the MATLAB path.

3. Run ```example[1-5]``` in Matlab.

4. [Optional] Run `./example0.out` (Linux) or `./Release/example0.exe` (Windows) with arguments `hedgehog_mesh.txt 3 14`.

## Known Issues

See [Issues](https://github.com/zishun/geodesic_matlab/issues).

## Author

[Danil Kirsanov](https://mathworks.com/matlabcentral/fileexchange/18168-exact-geodesic-for-triangular-meshes)

## Related Projects

* [libigl/libigl](https://github.com/libigl/libigl/blob/master/include/igl/exact_geodesic.h): a wrapper for the same exact geodesic algorithm implementation, exposing it through an Eigen-based API.
* [mojocorp/geodesic](https://github.com/mojocorp/geodesic): the same implementation with cross-platform CMakeLists and Python binding.

