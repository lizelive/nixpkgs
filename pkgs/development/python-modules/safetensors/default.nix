{ lib
, buildPythonPackage
, fetchPypi
}:

buildPythonPackage rec {
  pname = "safetensors";
  version = "0.3.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "5be8b2fccdc6aec84c9d6732180575fe1ba3afc559cbe96e2301eacc45c5b9a6";
  };

  # # Extra packages (may not be necessary)
  # torch ; extra == 'all'
  # numpy ; extra == 'all'
  # tensorflow ; extra == 'all'
  # jax ; extra == 'all'
  # flax ; extra == 'all'
  # paddlepaddle ; extra == 'all'
  # black (==22.3) ; extra == 'all'
  # isort (>=5.5.4) ; extra == 'all'
  # flake8 (>=3.8.3) ; extra == 'all'
  # click (==8.0.4) ; extra == 'all'
  # setuptools-rust ; extra == 'all'
  # huggingface-hub ; extra == 'all'
  # pytest ; extra == 'all'
  # pytest-benchmark ; extra == 'all'
  # h5py ; extra == 'all'
  # torch ; extra == 'dev'
  # numpy ; extra == 'dev'
  # tensorflow ; extra == 'dev'
  # jax ; extra == 'dev'
  # flax ; extra == 'dev'
  # paddlepaddle ; extra == 'dev'
  # black (==22.3) ; extra == 'dev'
  # isort (>=5.5.4) ; extra == 'dev'
  # flake8 (>=3.8.3) ; extra == 'dev'
  # click (==8.0.4) ; extra == 'dev'
  # setuptools-rust ; extra == 'dev'
  # huggingface-hub ; extra == 'dev'
  # pytest ; extra == 'dev'
  # pytest-benchmark ; extra == 'dev'
  # h5py ; extra == 'dev'
  # jax ; extra == 'jax'
  # flax ; extra == 'jax'
  # numpy ; extra == 'numpy'
  # paddlepaddle ; extra == 'paddlepaddle'
  # black (==22.3) ; extra == 'quality'
  # isort (>=5.5.4) ; extra == 'quality'
  # flake8 (>=3.8.3) ; extra == 'quality'
  # click (==8.0.4) ; extra == 'quality'
  # tensorflow ; extra == 'tensorflow'
  # setuptools-rust ; extra == 'testing'
  # huggingface-hub ; extra == 'testing'
  # pytest ; extra == 'testing'
  # pytest-benchmark ; extra == 'testing'
  # h5py ; extra == 'testing'
  # numpy ; extra == 'testing'
  # torch ; extra == 'torch'
  meta = with lib; {
    description = "Fast and Safe Tensor serialization";
    homepage = https://github.com/huggingface/safetensors;
    license = licenses.asl20;
    maintainers = [ maintainers.lizelive ];
  };
}