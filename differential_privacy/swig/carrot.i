// carrot.i - SWIG interface
%module carrot
%{
#include "differential_privacy/algorithms/util.h"
%}

%include std_string.i
%inline %{
  using namespace std;
%}
%apply const std::string& {std::string* foo};

// Parse the original header file
%include "../bazel-differential-privacy/external/com_google_absl/absl/base/attributes.h"
%include "../differential_privacy/algorithms/util.h"
%include "../differential_privacy/base/statusor.h"

%inline %{
  using namespace differential_privacy;
  using namespace differential_privacy::base;
  %}

%naturalvar;

//%rename(base_status) base::StatusOr differential_privacy::base::StatusOr;

// Instantiate some templates
%template(statusOr_double) differential_privacy::base::StatusOr<double>;

