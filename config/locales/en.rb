{
  :en => {
    :i18n => {
      :plural => {
        :rule => lambda { |n| 
          n == 1 ? :one : :other
        }
      }
    }
  }
}