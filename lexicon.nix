{ lib
, buildPythonPackage
, pytestCheckHook
, fetchPypi
, isPy3k
, poetry
, beautifulsoup4
, tldextract
, requests
, pyyaml
, cryptography
, pytest-vcr
, vcrpy
}:

buildPythonPackage rec {
  pname = "dns-lexicon";
  version = "3.8.4";
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1j5q3lfkj1hdxbb9z38724qp68rzqs9rd0xaf74x2v8cdx9929vm";
  };

  nativeBuildInputs = [ poetry ];

  propagatedBuildInputs = [ beautifulsoup4 tldextract pyyaml requests cryptography ];

  # Tests are failing for some reason...
  # checkInputs = [ pytestCheckHook pytest-vcr vcrpy ];

  doCheck = isPy3k;

  pythonImportsCheck = [
    "lexicon"
  ];

  meta = with lib; {
    description = "Manipulate DNS records on various DNS providers in a standardized/agnostic way.";
    homepage = "https://github.com/AnalogJ/lexicon";
    license = licenses.mit;
  };
}

