module Sap
  module Views
    include Alf::Viewpoint
    expects Native

    def suppliers_in_paris
      restrict(suppliers, city: "Paris")
    end

    def suppliers_in_london
      restrict(suppliers, city: "London")
    end

  end
end
