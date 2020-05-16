classdef Materials
    properties
        rho
    end
    methods
        function obj = Materials(rho)
            obj.rho = rho;
        end
    end
    enumeration
        IRON (7860)
        SILVER (10500)
        GOLD (19300)
        COPPER (8920)
        LEAD (11350)
        WOOD (632.1428571)
        GLASS (2530)
        PVC (1395)
        NYLON (1140)
        CONCRETE (2300)
        STEEL (7850)
        ALUMINIUM (2700)
        NICKEL (8900)
        TIN (7850)
        TITANIUM (4500)
        BRONZE (8800)
        TUNGSTEN (19300)
        LITHIUM (530)
        CLAY (1250)
        GRANITE (2650)
        QUARTZ (2650)
        MARBLE (2700)
        LIMESTONE (2650)
    end
end

