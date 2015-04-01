# MSketch

MSketch is a class that holds the sketch of a matrix. This class is based on
Edo Liberty's award winning paper [Simple and Deterministic Matrix Sketching](http://www.cs.yale.edu/homes/el327/papers/simpleMatrixSketching.pdf).

The abstract to Liberty's paper introduces the sketch of a matrix as,

> A sketch of a matrix A is another matrix B which is signifi- cantly smaller than A, but still approximates it well. Find- ing such sketches efficiently is an important building block in modern algorithms for approximating, for example, the PCA of massive matrices. This task is made more challeng- ing in the streaming model, where each row of the input matrix can be processed only once and storage is severely limited.

Therefore, a matrix sketch is best used in a streaming environment. For example, streaming
sensor data at fixed window sizes is one application.
