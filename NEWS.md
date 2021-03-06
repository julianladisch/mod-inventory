## 7.0.0 Unreleased

* Require `holdingsRecordId` from `item` (MODINV-39)
* Removes `title` from `item` (MODINV-37)
* Removes `instanceId` from `item` (MODINV-38)
* Removes `permanentLocationId` from `item` (MODINV-37)
* Removes `creators` from `instance` (MODINV-41)
* Adds `contributorNameTypeId` to `contributors` in `instances` (MODINV-41)
* Provides inventory interface version 5.0
* Requires item-storage interface version 5.0
* Requires instance-storage interface version 4.0

## 6.0.0 2017-12-20

* Removes `location` property from `item` record
* `title` is now optional for an `item` (MODINV-34)
* Adds `holdingsRecordId` to item (MODINV-30)
* MODS ingest now creates holdings records (MODINV-30) 
* Introduces `enumeration`, `chronology`, `numberOfPieces`, `notes`, `pieceIdentifiers` (MODINV-33)
* Introduces `permanentLocation` and `temporaryLocation` properties (which include the name fetched from `shelf-locations`)
* Provides inventory interface version 4.2
* Requires item-storage interface version 4.1
* Requires instance-storage interface version 3.0
* Requires holding-storage interface version 1.0
* Requires shelf-locations interface version 1.0
* Requires instance-types interface version 1.0
* Requires identifier-types interface version 1.0
* Requires contributor-name-types interface version 1.0
* Adds mod- prefix to names of the built artifacts (FOLIO-813)

## 5.1.1 2017-09-01

* Generates Descriptors at build time from templates in ./descriptors (FOLIO-701)
* Remove `module.items.enabled` and `inventory-storage.all` permissions from
`inventory.all` set, as part of moving permissions to UI modules (MODINV-23)

## 5.1.0 2017-08-03

* MODINVSTOR-12 Searching and sorting on material type properties (e.g. materialType.name)
* Provides inventory interface version 2.1 (notes additional CQL indexes in comments)
* Requires item-storage interface version 3.1
* Include implementation version in `id` in Module Descriptor
* MODINV-18 - Fix for unique barcode check when changing barcode

## 5.0.0 2017-06-07

* Items do not require relating to an instance (instanceId is optional)
* Items do not require a barcode (no uniqueness check performed when not supplied)
* Items require a title
* Items require a reference to a material type
* Items require a reference to a permanent loan type
* Inventory.all permission set includes permissions for related UI tasks
* Requires item-storage interface version 3.0
* Requires instance-storage interface version 2.0
* Requires material-types interface version 2.0
* Requires loan-types interface version 2.0

## 4.4.0 2017-05-31

* Makes the all inventory permissions set visible (requires Okapi 1.3.0)
* Includes permission definition for enabling the items UI module (included in all permissions set)

## 4.3.0 2017-05-09

* Include total record count in item and instance collection resources

## 4.2.0 2017-05-08

* Provide permanent and temporary loan type associations for items
* Include name of loan type in item representation (by querying loan type controlled vocabulary)

## 4.0.0 2017-04-25

* Use UUID to reference material types

## 3.0.0 2017-04-04

* Required permissions for requests

## 2.0.0 2017-04-03

* Initial release
