<!---

    Slatwall - An Open Source eCommerce Platform
    Copyright (C) ten24, LLC

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

    Linking this program statically or dynamically with other modules is
    making a combined work based on this program.  Thus, the terms and
    conditions of the GNU General Public License cover the whole
    combination.

    As a special exception, the copyright holders of this program give you
    permission to combine this program with independent modules and your
    custom code, regardless of the license terms of these independent
    modules, and to copy and distribute the resulting program under terms
    of your choice, provided that you follow these specific guidelines:

	- You also meet the terms and conditions of the license of each
	  independent module
	- You must not alter the default display of the Slatwall name or logo from
	  any part of the application
	- Your custom code must not alter or create any files inside Slatwall,
	  except in the following directories:
		/integrationServices/

	You may copy and distribute the modified version of this program that meets
	the above guidelines as a combined work under the terms of GPL for this program,
	provided that you include the source code of that other code when and as the
	GNU GPL requires distribution of source code.

    If you modify this program, you may extend this exception to your version
    of the program, but you are not obligated to do so.

Notes:

--->
<cfimport prefix="swa" taglib="../../../tags" />
<cfimport prefix="hb" taglib="../../../org/Hibachi/HibachiTags" />


<cfparam name="rc.productTypeSmartList" type="any" />
<cfparam name="rc.productTypeCollectionList" type="any" />

<cfset rc.productTypeSmartList.addOrder("productTypeName|ASC") />

<cfoutput>

	<hb:HibachiEntityActionBar type="listing" object="#rc.productTypeSmartList#" showCreate="false">

		<!--- Create --->
		<hb:HibachiEntityActionBarButtonGroup>
			<hb:HibachiActionCallerDropdown title="#$.slatwall.rbKey('define.create')#" icon="plus" dropdownClass="pull-right">
				<hb:HibachiActionCaller action="admin:entity.createproducttype" text="#rc.$.slatwall.rbKey('define.bundle')# #rc.$.slatwall.rbKey('entity.producttype')#" querystring="baseProductType=productBundle" type="list" />
				<hb:HibachiActionCaller action="admin:entity.createproducttype" text="#rc.$.slatwall.rbKey('define.contentAccess')# #rc.$.slatwall.rbKey('entity.producttype')#" querystring="baseProductType=contentAccess" type="list" />
				<hb:HibachiActionCaller action="admin:entity.createproducttype" text="#rc.$.slatwall.rbKey('define.event')# #rc.$.slatwall.rbKey('entity.producttype')#" querystring="baseProductType=event" type="list" />
				<hb:HibachiActionCaller action="admin:entity.createproducttype" text="#rc.$.slatwall.rbKey('define.giftCard')# #rc.$.slatwall.rbKey('entity.producttype')#" querystring="baseProductType=gift-card" type="list" />
				<hb:HibachiActionCaller action="admin:entity.createproducttype" text="#rc.$.slatwall.rbKey('define.merchandise')# #rc.$.slatwall.rbKey('entity.producttype')#" querystring="baseProductType=merchandise" type="list" />
				<hb:HibachiActionCaller action="admin:entity.createproducttype" text="#rc.$.slatwall.rbKey('define.subscription')# #rc.$.slatwall.rbKey('entity.producttype')#" querystring="baseProductType=subscription" type="list" />
			</hb:HibachiActionCallerDropdown>
		</hb:HibachiEntityActionBarButtonGroup>
	</hb:HibachiEntityActionBar>

	<cfset rc.productTypeCollectionList.addFilter('parentProductType','null','is')/>
	<cfset rc.productTypeCollectionList.setDisplayProperties(displayPropertiesList='activeFlag',columnConfig={
		isSearchable="true",
		isVisible="true",
		isDeletable="true"
	})/>
	<cfset rc.productTypeCollectionList.addDisplayProperty(displayProperty='productTypeName',columnConfig={
		isSearchable="true",
		isVisible="true",
		isDeletable="true",
		tdclass="primary"
	},prepend=true)/>
	<cfset rc.productTypeCollectionList.addDisplayProperty(displayProperty='productTypeID',columnConfig={
		isSearchable="false",
		isVisible="false",
		isDeletable="false"
	})/>
	<cfset rc.productTypeCollectionList.addDisplayAggregate('childProductTypes','COUNT','childProductTypesCount')/>
	
	<hb:HibachiListingDisplay collectionList="#rc.productTypeCollectionList#">
	</hb:HibachiListingDisplay>

</cfoutput>
