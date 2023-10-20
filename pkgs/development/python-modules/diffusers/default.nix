{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
# propagated build inputs
, pillow
, filelock
, huggingface-hub
, importlib-metadata
, numpy
, regex
, requests
, safetensors
# optional dependencies
, torch
, accelerate
, jinja2
, datasets
, protobuf3
, tensorboard
}:

buildPythonPackage rec {
  pname = "diffusers";
  version = "0.21.4";

  disabled = pythonOlder "3.7.0"; # requires python version >=3.7.0

  src = fetchPypi {
    inherit pname version;
    sha256 = "3fac38833179427f167c675dda71ee7b4f5e627200457a8d527e40cdaf972688";
  };

  propagatedBuildInputs = [
    pillow
    filelock
    huggingface-hub
    importlib-metadata
    numpy
    regex
    requests
    safetensors
  ];

passthru.optional-dependencies = {
  torch = [
    torch
    accelerate
  ];
  training = [
    jinja2
    accelerate
    datasets
    protobuf3
    tensorboard
  ];
};

  meta = with lib; {
    description = "State-of-the-art diffusion in PyTorch and JAX";
    homepage = https://github.com/huggingface/diffusers;
    license = licenses.asl20;
    maintainers = [ maintainers.lizelive ];
  };
}
