<cfcomponent hint="lessAccounting" output="false" extends="coldbox.system.Plugin" cache="true">

	<cffunction name="init" access="public" returnType="lessAccounting" output="false" hint="Constructor">
		<cfargument name="controller" type="any"/>
		<cfscript>
			// Setup Plugin
			super.init(arguments.controller);
			setPluginName("Less Accounting App");
			setPluginVersion("1.0");
			setPluginDescription("A REST wrapper to the Less Accounting API service");
			setPluginAuthor("Jeremy R DeYoung");
			setPluginAuthorURL("http://www.lunarfly.com");

			// Check settings
			if( not settingExists("lessAccounting_api_key") ){
				$throw(message="lessAccounting_api_key setting not defined, please define it.",type="lessAccounting.invalidSettings");
			}

			// Check settings
			if( not settingExists("lessAccounting_business_domain") ){
				$throw(message="lessAccounting_business_domain setting not defined, please define it.",type="lessAccounting.invalidSettings");
			}

			// Setup API Key
			setAPIKey(getSetting("lessAccounting_api_key"));
			// Setup Subdomain
			setSubDomain(getSetting("lessAccounting_business_domain"));

			return this;
		</cfscript>
	</cffunction>

	<!--- Expenses --->
    <cffunction name="createExpense" output="false" access="public" returntype="any">
		<cfscript>
			arguments.httpMethod = "post";
			arguments.httpURL = "expenses";
			arguments.paramPrefix = "expense";
			results = sendAndReceive(argumentCollection=arguments);
			return results.fileContent;
		</cfscript>
    </cffunction>
    <cffunction name="showExpense" output="false" access="public" returntype="any">
		<cfscript>
			if(!structKeyExists(arguments,"id"))
			{
				$throw(message="Please provide a valid Expense ID",type="lessAccounting.variableUndefined");
			}
			arguments.httpMethod = "get";
			arguments.httpURL = "expenses/#arguments.id#";
			arguments.paramPrefix = "";
			results = sendAndReceive(argumentCollection=arguments);
			return results.filecontent;
		</cfscript>
    </cffunction>
    <cffunction name="listExpenses" output="false" access="public" returntype="any">
		<cfscript>
			arguments.httpMethod = "get";
			arguments.httpURL = "expenses";
			arguments.paramPrefix = "";
			results = sendAndReceive(argumentCollection=arguments);

			return results.Filecontent;
		</cfscript>
    </cffunction>


	<!--- Expense Category --->
    <cffunction name="createExpenseCategory" output="false" access="public" returntype="any">
		<cfscript>
			arguments.httpMethod = "post";
			arguments.httpURL = "expense_categories";
			arguments.paramPrefix = "expense_category";
			results = sendAndReceive(argumentCollection=arguments);
			return results.fileContent;
		</cfscript>
    </cffunction>
    <cffunction name="showExpenseCategory" output="false" access="public" returntype="any">
		<cfscript>
			if(!structKeyExists(arguments,"id"))
			{
				$throw(message="Please provide a valid Expense Category ID",type="lessAccounting.variableUndefined");
			}
			arguments.httpMethod = "get";
			arguments.httpURL = "expense_categories/#arguments.id#";
			arguments.paramPrefix = "";
			results = sendAndReceive(argumentCollection=arguments);
			return results.filecontent;
		</cfscript>
    </cffunction>
    <cffunction name="listExpenseCategories" output="false" access="public" returntype="any">
		<cfscript>
			arguments.httpMethod = "get";
			arguments.httpURL = "expense_categories";
			arguments.paramPrefix = "";
			results = sendAndReceive(argumentCollection=arguments);

			return results.Filecontent;
		</cfscript>
    </cffunction>


	<!--- Contacts --->
    <cffunction name="createContact" output="false" access="public" returntype="any">
		<cfscript>
			arguments.httpMethod = "post";
			arguments.httpURL = "contacts";
			arguments.paramPrefix = "contact";
			results = sendAndReceive(argumentCollection=arguments);
			return results.fileContent;
		</cfscript>
    </cffunction>
    <cffunction name="showContact" output="false" access="public" returntype="any">
		<cfscript>
			if(!structKeyExists(arguments,"id"))
			{
				$throw(message="Please provide a valid Contact ID",type="lessAccounting.variableUndefined");
			}
			arguments.httpMethod = "get";
			arguments.httpURL = "contacts/#arguments.id#";
			arguments.paramPrefix = "";
			results = sendAndReceive(argumentCollection=arguments);
			return results.filecontent;
		</cfscript>
    </cffunction>
    <cffunction name="listContacts" output="false" access="public" returntype="any">
		<cfscript>
			arguments.httpMethod = "get";
			arguments.httpURL = "contacts";
			arguments.paramPrefix = "";
			results = sendAndReceive(argumentCollection=arguments);

			return results.Filecontent;
		</cfscript>
    </cffunction>


	<!--- Bank Accounts --->
    <cffunction name="createBankAccount" output="false" access="public" returntype="any">
		<cfscript>
			arguments.httpMethod = "post";
			arguments.httpURL = "bank_accounts";
			arguments.paramPrefix = "";
			results = sendAndReceive(argumentCollection=arguments);
			return results.fileContent;
		</cfscript>
    </cffunction>
    <cffunction name="showBankAccount" output="false" access="public" returntype="any">
		<cfscript>
			if(!structKeyExists(arguments,"id"))
			{
				$throw(message="Please provide a valid Contact ID",type="lessAccounting.variableUndefined");
			}
			arguments.httpMethod = "get";
			arguments.paramPrefix = "";
			arguments.httpURL = "bank_accounts/#arguments.id#";
			results = sendAndReceive(argumentCollection=arguments);
			return results.filecontent;
		</cfscript>
    </cffunction>
    <cffunction name="listBankAccounts" output="false" access="public" returntype="any">
		<cfscript>
			arguments.httpMethod = "get";
			arguments.paramPrefix = "";
			arguments.httpURL = "bank_accounts";
			results = sendAndReceive(argumentCollection=arguments);

			return results.Filecontent;
		</cfscript>
    </cffunction>


	<!--- Payments --->
    <cffunction name="createPayment" output="false" access="public" returntype="any">
		<cfscript>
			arguments.httpMethod = "post";
			arguments.httpURL = "payments";
			arguments.paramPrefix = "payment";
			results = sendAndReceive(argumentCollection=arguments);
			return results.fileContent;
		</cfscript>
    </cffunction>
    <cffunction name="showPayments" output="false" access="public" returntype="any">
		<cfscript>
			if(!structKeyExists(arguments,"id"))
			{
				$throw(message="Please provide a valid Payment ID",type="lessAccounting.variableUndefined");
			}
			arguments.httpMethod = "get";
			arguments.paramPrefix = "";
			arguments.httpURL = "payments/#arguments.id#";
			results = sendAndReceive(argumentCollection=arguments);
			return results.filecontent;
		</cfscript>
    </cffunction>
    <cffunction name="listPayments" output="false" access="public" returntype="any">
		<cfscript>
			arguments.httpMethod = "get";
			arguments.paramPrefix = "";
			arguments.httpURL = "payments";
			results = sendAndReceive(argumentCollection=arguments);

			return results.Filecontent;
		</cfscript>
    </cffunction>


	<!--- Transfer Funds --->
    <cffunction name="createTransferFund" output="false" access="public" returntype="any">
		<cfscript>
			arguments.httpMethod = "post";
			arguments.httpURL = "transfer_funds";
			arguments.paramPrefix = "transfer_fund";
			results = sendAndReceive(argumentCollection=arguments);
			return results.fileContent;
		</cfscript>
    </cffunction>



	<!--- Less Accounting API Key --->
    <cffunction name="setAPIKey" output="false" access="public" returntype="void" hint="Set the Less Accounting credentials">
    	<cfargument name="apikey" type="string" required="true" default="" hint="The Less Accounting api key"/>
		<cfscript>
			instance.apikey = arguments.apikey;
		</cfscript>
    </cffunction>
    <cffunction name="getAPIKey" output="false" access="public" returntype="string" hint="Set the Less Accounting api key">

		<cfreturn instance.apikey />
    </cffunction>


	<!--- Less Accounting Business Subdomain --->
    <cffunction name="setSubDomain" output="false" access="public" returntype="void" hint="Set the Less Accounting Subdomain">
    	<cfargument name="subdomain" type="string" required="true" default="" hint="The Less Accounting Subdomain"/>
		<cfscript>
			instance.subdomain = arguments.subdomain;
		</cfscript>
    </cffunction>
    <cffunction name="getSubDomain" output="false" access="public" returntype="string" hint="Set the Less Accounting Subdomain">

		<cfreturn instance.subdomain />
    </cffunction>


	<!--- Less Accounting Username --->
    <cffunction name="setUsername" output="false" access="public" returntype="void" hint="Set the Less Accounting Username">
    	<cfargument name="username" type="string" required="true" default="" hint="The Less Accounting Username"/>
		<cfscript>
			instance.username = arguments.username;
		</cfscript>
    </cffunction>
    <cffunction name="getUsername" output="false" access="public" returntype="string" hint="Set the Less Accounting Username">

		<cfreturn instance.username />
    </cffunction>


	<!--- Less Accounting Password --->
    <cffunction name="setPassword" output="false" access="public" returntype="void" hint="Set the Less Accounting Password">
    	<cfargument name="password" type="string" required="true" default="" hint="The Less Accounting Password"/>
		<cfscript>
			instance.password = arguments.password;
		</cfscript>
    </cffunction>
    <cffunction name="getPassword" output="false" access="public" returntype="string" hint="Set the Less Accounting Password">

		<cfreturn instance.password />
    </cffunction>


	<!--- Private Functions --->
    <cffunction name="sendAndReceive" output="false" access="private" returntype="struct">
		<cfscript>
			var httpService = new http();
			var queryString = "";
			var argumentsList = StructKeyList(arguments);
			var httpURL = arguments.httpURL;
			var httpMethod = arguments.httpMethod;
			var paramPrefix = arguments.paramPrefix;

			if(paramPrefix NEQ "")
			{
				for(var i=1;i<=ListLen(argumentsList);i++)
				{
					if(!ListFindNoCase("httpMethod,httpURL,paramPrefix",ListGetAt(argumentsList,i)))
					{
						queryString = queryString & "#paramPrefix#[" & ListGetAt(argumentsList,i) & "]=" & URLEncodedFormat(arguments[ListGetAt(argumentsList,i)]) & "&";
					}
				}
			}

			httpService.setUsername(this.getUsername());
			httpService.setPassword(this.getPassword());
			httpService.addParam(type="header",name="Content-Type",value="text/html");
			httpService.setMethod(httpMethod);
		    httpService.setCharset("utf-8");
		    httpService.setUrl("https://#this.getSubdomain()#.lessaccounting.com/#httpURL#.xml?api_key=#this.getAPIKey()#&#queryString#");
			var result = httpService.send().getPrefix();
			var resultNew = StructNew();
			resultNew['queryString'] = queryString;
			StructAppend(resultNew,result);


			return resultNew;
		</cfscript>
    </cffunction>

</cfcomponent>