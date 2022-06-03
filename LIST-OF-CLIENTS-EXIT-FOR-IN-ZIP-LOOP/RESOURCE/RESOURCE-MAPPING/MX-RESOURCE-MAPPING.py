PAGE_LOGIN = {
	"TEXTBOX_USERNAME":					"id:uid",
	"TEXTBOX_PASSWORD":					"id:pwd",
	"BUTTON_LOGIN":						"id:login-button"
}

COMPONENT_LOGIN_ERROR = {
	"ALERT_BOX":						"class:alert-danger"
}

COMPONENT_SIDE_BAR_CLIENT = {
	"LINK_CREATE_CLIENT":				"xpath://*[@id='mifos-reskin-side-nav']//a/span[normalize-space(.)='Client']"
}

PAGE_CREATE_CLIENT = {
	"TITLE_CREATE_CLIENT":				"xpath://div[@ng-controller='CreateClientController']/div/div/div/h3",
	"DROPDOWN_LIST_OFFICE": 			"css:#officeId_chosen .chosen-single",
	"DROPDOWN_LIST_LEGAL_FORM":			"id:legalFormId",
	"TEXTBOX_FIRSTNAME":				"id:firstname",
	"TEXTBOX_MIDDLENAME":				"id:middlename",
	"TEXTBOX_LASTNAME":					"id:lastname",
	"TEXTBOX_MOBILE":					"id:mobileNo",
	"TEXT_MOBILE":						"xpath://fieldset/div[@class='form-group']/label[@for='mobileNo']",
	"DATEPICKER_DATE_OF_BIRTH":			"id:dateofbirth",
	"CHECKBOX_ACTIVE":					"id:activeCheckbox",
	"DATEPICKER_ACTIVATION_DATE":		"id:activationDate",
	"DATEPICKER_SUBMITTED_ON":			"id:submittedon",
	"CHECKBOX_OPEN_SAVINGS":			"id:opensavingsproduct",
	"DROPDOWN_LIST_SAVINGS_PRODUCT":	"id:savingsProductId",		
	"BUTTON_SUBMIT":					"id:save"
}

COMPONENT_CREATE_CLIENT_ERROR = {
	"REQUIRED_FIRSTNAME":				"xpath://div[@class='col-sm-2']/form-validate/span[@ng-show='createclientform.firstname.$invalid']/small[last()-1]",
	"REQUIRED_LASTNAME":				"xpath://div[@class='col-sm-2']/form-validate/span[@ng-show='createclientform.lastname.$invalid']/small[last()-1]",
	"NUMERIC_MOBILE":					"xpath://div[@class='col-sm-2']/span/small[@ng-show='createclientform.mobileNo.$error.pattern']"
}

PAGE_VIEW_CLIENT = {
	"TITLE_VIEW_CLIENT":				"css:[class='client-title'] strong",
}
PAGE_CLIENT = {
	"TOP_MENU_CLIENTS":					"xpath://ul[@id='main-menu-left']/li/a[normalize-space(.)='Clients']",
	"SUB_MENU_CLIENTS_LINK":			"xpath://a[@href='#/clients']",
	"TITLE_LIST_OF_CLIENTS":			"xpath://div[@class='toolbar']/h4",
	"DATA_CLIENT_NAME":					"xpath://td[count(//th[text()='Name'])]",
	"DATA_CLIENT_NUMBER":				"xpath://td[count(//th[text()='Client #']/preceding-sibling::*)+1]",
	"SYMBOL_LAST_PAGE_NUMBER":			"xpath://dir-pagination-controls/ul/li/a[@ng-click='setCurrent(pagination.last)']",
	"TEXT_FIRST_PAGE_NUMBER":			"xpath://dir-pagination-controls/ul/li/a[text()='1']",
	"TEXT_LAST_PAGE_NUMBER":			"xpath://dir-pagination-controls/ul/li[last()-2]/a",
	"SELECTED_PAGE_NUMBER":				"xpath://dir-pagination-controls/ul/li[@class='ng-scope active']"
}

COMPONENT_CLIENT = {
	"IMAGE_CENTER_LOADER":				"xpath://div/span[@class='centerloader']/img[@src='images/833.svg']"
}