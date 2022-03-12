using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CDBModel {
    public class LookupServiceAlias {
        public const string CDB_COUNTRIES_COUNTRY_ID = "/cdb/api/CDBCountry/LookupListing";
        public const string CDB_LEVEL_1_ADDRESS_COMPONENTS_LEVEL_1_ADDRESS_COMPONENT_ID = "/cdb/api/CDBLevel1State/LookupListing";
        public const string CDB_LEVEL_2_ADDRESS_COMPONENTS_LEVEL_2_ADDRESS_COMPONENT_ID = "/cdb/api/CDBLevel2District/LookupListing";
        public const string CDB_LEVEL_3_ADDRESS_COMPONENTS_LEVEL_3_ADDRESS_COMPONENT_ID = "/cdb/api/CDBLevel3City/LookupListing";

        public const string CDB_SOCIETIES_SOCIETY_ID = "/cdb/api/CDBSociety/LookupListing";
        public const string CDB_WORKING_UNIT_ENTITIES_WORKING_UNIT_ENTITY_ID = "/cdb/api/CDBWorkingUnitEntities/LookupListing";
        public const string CDB_WORKING_UNITS_GROUP_WORKING_UNIT_ID = "/cdb/api/CDBWorkingUnit/LookupListing";
    }
}