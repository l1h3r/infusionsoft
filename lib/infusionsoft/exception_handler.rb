module Infusionsoft
  class ExceptionHandler

    ERRORS = {
      1 => Infusionsoft::InvalidConfigError,
      2 => Infusionsoft::InvalidKeyError,
      3 => Infusionsoft::UnexpectedError,
      4 => Infusionsoft::DatabaseError,
      5 => Infusionsoft::RecordNotFoundError,
      6 => Infusionsoft::LoadingError,
      7 => Infusionsoft::NoTableAccessError,
      8 => Infusionsoft::NoFieldAccessError,
      9 => Infusionsoft::NoTableFoundError,
      10 => Infusionsoft::NoFieldFoundError,
      11 => Infusionsoft::NoFieldsError,
      12 => Infusionsoft::InvalidParameterError,
      13 => Infusionsoft::FailedLoginAttemptError,
      14 => Infusionsoft::NoAccessError,
      15 => Infusionsoft::FailedLoginAttemptPasswordExpiredError
    }

    def initialize(error)
      error_class = ERRORS[error.faultCode]
      if error_class
        raise error_class, error.faultString
      else
        raise InfusionsoftError, error.faultString
      end
    end

  end
end
