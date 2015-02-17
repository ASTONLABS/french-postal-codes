# French Postal Codes Gem

This gem contains french postal codes data and helpers to fetch it.

## Installation

Add to gemfile:

    gem "french_postal_codes"

## Usage

### Fetch cities belonging to postal code

    # Both calls will have the same result, #places method is alias of #cities
    FrenchPostalCode.cities(postal_code_here)
    FrenchPostalCode.places(postal_code_here)

Example

    FrenchPostalCode.cities(24100)
    => ["Lembras", "Creysse", "Bergerac", "Saint-Laurent-des-Vignes"]

    FrenchPostalCode.cities("22000")
    => ["Saint-Brieuc"]

 > Note that it doesn't matter whether you're passing postal code as a string or integer object (it always gets converted to string internally)