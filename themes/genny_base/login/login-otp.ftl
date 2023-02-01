<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
        <form id="kc-totp-login-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <#if otpLogin.userOtpCredentials?size gt 1>
            <div class="flex items-center space-x-4">
              <#list otpLogin.userOtpCredentials as otpCredential>
                <@radioPrimary.kw
                  checked=(otpCredential.id == otpLogin.selectedCredentialId)
                  id="kw-otp-credential-${otpCredential?index}"
                  name="selectedCredentialId"
                  tabIndex="${otpCredential?index}"
                  value="${otpCredential.id}"
                >
                  ${otpCredential.userLabel}
                </@radioPrimary.kw>
              </#list>
            </div>
          </#if>
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="totp" class="${properties.kcLabelClass!}">${msg("loginTotpOneTime")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input id="totp" name="otp" invalid=["totp"] autocomplete="off" type="text" class="${properties.kcInputClass!}" autofocus />
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                    </div>
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <div class="${properties.kcFormButtonsWrapperClass!}">
                        <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="submitAction" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                        <input class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" name="cancel" id="kc-cancel" type="submit" value="${msg("doCancel")}"/>
                    </div>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>