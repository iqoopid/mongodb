--
-- PostgreSQL database dump
--

-- Dumped from database version 11.21
-- Dumped by pg_dump version 11.21

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO bn_keycloak;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO bn_keycloak;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO bn_keycloak;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO bn_keycloak;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO bn_keycloak;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO bn_keycloak;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO bn_keycloak;

--
-- Name: client; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO bn_keycloak;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.client_attributes OWNER TO bn_keycloak;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO bn_keycloak;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO bn_keycloak;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO bn_keycloak;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO bn_keycloak;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO bn_keycloak;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO bn_keycloak;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO bn_keycloak;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO bn_keycloak;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO bn_keycloak;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO bn_keycloak;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO bn_keycloak;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO bn_keycloak;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO bn_keycloak;

--
-- Name: component; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO bn_keycloak;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO bn_keycloak;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO bn_keycloak;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO bn_keycloak;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO bn_keycloak;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO bn_keycloak;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO bn_keycloak;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO bn_keycloak;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO bn_keycloak;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO bn_keycloak;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO bn_keycloak;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO bn_keycloak;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO bn_keycloak;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO bn_keycloak;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO bn_keycloak;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO bn_keycloak;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO bn_keycloak;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO bn_keycloak;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO bn_keycloak;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO bn_keycloak;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO bn_keycloak;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO bn_keycloak;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO bn_keycloak;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO bn_keycloak;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO bn_keycloak;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO bn_keycloak;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO bn_keycloak;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO bn_keycloak;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO bn_keycloak;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO bn_keycloak;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO bn_keycloak;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO bn_keycloak;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO bn_keycloak;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO bn_keycloak;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO bn_keycloak;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO bn_keycloak;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO bn_keycloak;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO bn_keycloak;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO bn_keycloak;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO bn_keycloak;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO bn_keycloak;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO bn_keycloak;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO bn_keycloak;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO bn_keycloak;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO bn_keycloak;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO bn_keycloak;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO bn_keycloak;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO bn_keycloak;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO bn_keycloak;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO bn_keycloak;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO bn_keycloak;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO bn_keycloak;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO bn_keycloak;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO bn_keycloak;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO bn_keycloak;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO bn_keycloak;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO bn_keycloak;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO bn_keycloak;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO bn_keycloak;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO bn_keycloak;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO bn_keycloak;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO bn_keycloak;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO bn_keycloak;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO bn_keycloak;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO bn_keycloak;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO bn_keycloak;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO bn_keycloak;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO bn_keycloak;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO bn_keycloak;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: bn_keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO bn_keycloak;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
72208d5b-bcdd-4a98-b48d-bd4f3f310d9a	\N	auth-cookie	a499feb5-9be3-463d-8e41-bfa85aed27f4	e20eb133-0f06-4a2f-9b59-b8f319e8c4f8	2	10	f	\N	\N
8d213bdc-ae2e-4d2e-b724-c56b6667e874	\N	auth-spnego	a499feb5-9be3-463d-8e41-bfa85aed27f4	e20eb133-0f06-4a2f-9b59-b8f319e8c4f8	3	20	f	\N	\N
05fd3bec-9a1b-4f53-9bf3-c69a4be3bf30	\N	identity-provider-redirector	a499feb5-9be3-463d-8e41-bfa85aed27f4	e20eb133-0f06-4a2f-9b59-b8f319e8c4f8	2	25	f	\N	\N
2806e9fb-0beb-4620-8891-0f3d83657d79	\N	\N	a499feb5-9be3-463d-8e41-bfa85aed27f4	e20eb133-0f06-4a2f-9b59-b8f319e8c4f8	2	30	t	12569768-46d3-46d6-a6fc-7b4c1ca4fcdb	\N
b0f34944-98f6-4e63-a433-67414c273644	\N	auth-username-password-form	a499feb5-9be3-463d-8e41-bfa85aed27f4	12569768-46d3-46d6-a6fc-7b4c1ca4fcdb	0	10	f	\N	\N
bf19441b-c6c9-4931-9347-3a79945e0af1	\N	\N	a499feb5-9be3-463d-8e41-bfa85aed27f4	12569768-46d3-46d6-a6fc-7b4c1ca4fcdb	1	20	t	037c589c-db50-40a3-a921-49df383f9a2f	\N
d6f2ed75-4acc-43cd-8146-a5cc775a53ad	\N	conditional-user-configured	a499feb5-9be3-463d-8e41-bfa85aed27f4	037c589c-db50-40a3-a921-49df383f9a2f	0	10	f	\N	\N
da51bf7c-243d-4a28-bdab-b2aa30299e18	\N	auth-otp-form	a499feb5-9be3-463d-8e41-bfa85aed27f4	037c589c-db50-40a3-a921-49df383f9a2f	0	20	f	\N	\N
77916b48-d74e-4d77-b081-0abd35f39642	\N	direct-grant-validate-username	a499feb5-9be3-463d-8e41-bfa85aed27f4	4fac46a7-24e7-4638-babf-d1267b1d563a	0	10	f	\N	\N
e4e5c21c-18e7-4ae3-b7dc-196c56b0c9ee	\N	direct-grant-validate-password	a499feb5-9be3-463d-8e41-bfa85aed27f4	4fac46a7-24e7-4638-babf-d1267b1d563a	0	20	f	\N	\N
0c389626-5ddd-4800-8f58-d75b9e0303a9	\N	\N	a499feb5-9be3-463d-8e41-bfa85aed27f4	4fac46a7-24e7-4638-babf-d1267b1d563a	1	30	t	dc759ad2-ead7-4d5b-a133-a5b235f5b181	\N
46f95fe9-d33d-4f28-bfbc-a6e8f3e26bc6	\N	conditional-user-configured	a499feb5-9be3-463d-8e41-bfa85aed27f4	dc759ad2-ead7-4d5b-a133-a5b235f5b181	0	10	f	\N	\N
1cbd68df-9534-4247-a6ce-3f9caf689b46	\N	direct-grant-validate-otp	a499feb5-9be3-463d-8e41-bfa85aed27f4	dc759ad2-ead7-4d5b-a133-a5b235f5b181	0	20	f	\N	\N
da038c7a-9024-410e-9111-ca51f76ed20b	\N	registration-page-form	a499feb5-9be3-463d-8e41-bfa85aed27f4	41c74f20-4b47-40a0-ba8f-6c3b6aea5599	0	10	t	f1c64644-0083-4438-a42f-9bdda70e6c1c	\N
76efc0d4-3fb0-438f-8d7f-6882db4ef7a9	\N	registration-user-creation	a499feb5-9be3-463d-8e41-bfa85aed27f4	f1c64644-0083-4438-a42f-9bdda70e6c1c	0	20	f	\N	\N
31b909f1-1882-4f1a-84c2-77b2f19bd5da	\N	registration-profile-action	a499feb5-9be3-463d-8e41-bfa85aed27f4	f1c64644-0083-4438-a42f-9bdda70e6c1c	0	40	f	\N	\N
7d2b75bf-6441-4258-8754-0aaeb76b50c3	\N	registration-password-action	a499feb5-9be3-463d-8e41-bfa85aed27f4	f1c64644-0083-4438-a42f-9bdda70e6c1c	0	50	f	\N	\N
6d8c26a4-dc9e-4eb2-bc44-6c88bea766f4	\N	registration-recaptcha-action	a499feb5-9be3-463d-8e41-bfa85aed27f4	f1c64644-0083-4438-a42f-9bdda70e6c1c	3	60	f	\N	\N
43ce3c39-80f5-4685-b389-0b2e9c7e878a	\N	reset-credentials-choose-user	a499feb5-9be3-463d-8e41-bfa85aed27f4	d171b57a-4968-4b8d-9567-617140d10acc	0	10	f	\N	\N
6e513adf-9e59-4dbe-a085-ddc0e234478b	\N	reset-credential-email	a499feb5-9be3-463d-8e41-bfa85aed27f4	d171b57a-4968-4b8d-9567-617140d10acc	0	20	f	\N	\N
623a6365-1e13-459d-b463-1fd32f60e7a6	\N	reset-password	a499feb5-9be3-463d-8e41-bfa85aed27f4	d171b57a-4968-4b8d-9567-617140d10acc	0	30	f	\N	\N
856fc082-a744-491a-bdea-fc5862042c49	\N	\N	a499feb5-9be3-463d-8e41-bfa85aed27f4	d171b57a-4968-4b8d-9567-617140d10acc	1	40	t	0879163d-766d-4ca4-8519-f4fa22de4728	\N
9fa19285-c968-4783-88e5-07e8e8b49a4c	\N	conditional-user-configured	a499feb5-9be3-463d-8e41-bfa85aed27f4	0879163d-766d-4ca4-8519-f4fa22de4728	0	10	f	\N	\N
cea1b373-e36c-41dd-aa3c-abadad3b4274	\N	reset-otp	a499feb5-9be3-463d-8e41-bfa85aed27f4	0879163d-766d-4ca4-8519-f4fa22de4728	0	20	f	\N	\N
8be788cf-2954-4f56-abda-e75188360d5b	\N	client-secret	a499feb5-9be3-463d-8e41-bfa85aed27f4	34dd7d78-4d4c-4af6-9bb8-a126d2ca60b5	2	10	f	\N	\N
1726de7b-3c4b-4221-813b-4127bc36cba8	\N	client-jwt	a499feb5-9be3-463d-8e41-bfa85aed27f4	34dd7d78-4d4c-4af6-9bb8-a126d2ca60b5	2	20	f	\N	\N
9d8a3244-1b77-4ea8-9dad-eb831c1cf022	\N	client-secret-jwt	a499feb5-9be3-463d-8e41-bfa85aed27f4	34dd7d78-4d4c-4af6-9bb8-a126d2ca60b5	2	30	f	\N	\N
816a948d-770f-456c-a02a-71bd0d7cda8f	\N	client-x509	a499feb5-9be3-463d-8e41-bfa85aed27f4	34dd7d78-4d4c-4af6-9bb8-a126d2ca60b5	2	40	f	\N	\N
11339524-4835-4ce9-ae4a-7abbaff34be2	\N	idp-review-profile	a499feb5-9be3-463d-8e41-bfa85aed27f4	44c40e37-bd53-4038-ba87-9c34a9aae368	0	10	f	\N	f34def34-5308-4c7b-aad6-6900882cbf08
d11b0631-e1e5-40ca-85cb-b72dc3c386bc	\N	\N	a499feb5-9be3-463d-8e41-bfa85aed27f4	44c40e37-bd53-4038-ba87-9c34a9aae368	0	20	t	6743d13e-cf10-4dea-af7e-94362e984054	\N
54c3c990-e835-4d97-9d0f-45f0cffd6049	\N	idp-create-user-if-unique	a499feb5-9be3-463d-8e41-bfa85aed27f4	6743d13e-cf10-4dea-af7e-94362e984054	2	10	f	\N	6cc61651-3ed4-4a8a-bcc2-bc2072806d94
1a927aed-1afc-484f-94b7-2ec3bd70c6b6	\N	\N	a499feb5-9be3-463d-8e41-bfa85aed27f4	6743d13e-cf10-4dea-af7e-94362e984054	2	20	t	a6efab51-73fe-401e-812f-a4b9e6c93a99	\N
2a0843df-f27d-4219-af74-9ec94fc7aaf0	\N	idp-confirm-link	a499feb5-9be3-463d-8e41-bfa85aed27f4	a6efab51-73fe-401e-812f-a4b9e6c93a99	0	10	f	\N	\N
ec866d8d-3b42-43ad-a33c-c19c3574b342	\N	\N	a499feb5-9be3-463d-8e41-bfa85aed27f4	a6efab51-73fe-401e-812f-a4b9e6c93a99	0	20	t	31a79f58-2d7c-4572-88af-b85edc32a866	\N
9e8fc1ca-755c-46f2-bea8-24e7591f16cc	\N	idp-email-verification	a499feb5-9be3-463d-8e41-bfa85aed27f4	31a79f58-2d7c-4572-88af-b85edc32a866	2	10	f	\N	\N
0f74c247-8d3b-4118-8423-09c7a406617f	\N	\N	a499feb5-9be3-463d-8e41-bfa85aed27f4	31a79f58-2d7c-4572-88af-b85edc32a866	2	20	t	f3168592-6556-442b-a248-393536cccbf7	\N
cb97079f-883a-4af3-b548-84eb2f9b2553	\N	idp-username-password-form	a499feb5-9be3-463d-8e41-bfa85aed27f4	f3168592-6556-442b-a248-393536cccbf7	0	10	f	\N	\N
41f4713e-8fea-409c-901a-a3a99135324f	\N	\N	a499feb5-9be3-463d-8e41-bfa85aed27f4	f3168592-6556-442b-a248-393536cccbf7	1	20	t	4dea394d-1e77-4182-b332-8209ad41af29	\N
610b9a35-8605-4a0d-9312-4249a01db672	\N	conditional-user-configured	a499feb5-9be3-463d-8e41-bfa85aed27f4	4dea394d-1e77-4182-b332-8209ad41af29	0	10	f	\N	\N
e056fd3b-5d57-4344-843e-3c96aeccc1b9	\N	auth-otp-form	a499feb5-9be3-463d-8e41-bfa85aed27f4	4dea394d-1e77-4182-b332-8209ad41af29	0	20	f	\N	\N
6cde4b94-cb81-4ae7-a0bb-3e50a0d9d96a	\N	http-basic-authenticator	a499feb5-9be3-463d-8e41-bfa85aed27f4	900234dc-2a4a-4572-a3f2-f112e433433b	0	10	f	\N	\N
358b2797-58a3-464b-81e2-7de8aeb8debb	\N	docker-http-basic-authenticator	a499feb5-9be3-463d-8e41-bfa85aed27f4	5669316a-5f82-4cc6-8217-a645cb67b3f7	0	10	f	\N	\N
b1a7f20e-fd89-4f78-b66c-769956d39126	\N	no-cookie-redirect	a499feb5-9be3-463d-8e41-bfa85aed27f4	48358105-a644-45b5-91c5-02c5caf3a1e5	0	10	f	\N	\N
976a5599-ce2e-4f4e-8257-8f06faad45c4	\N	\N	a499feb5-9be3-463d-8e41-bfa85aed27f4	48358105-a644-45b5-91c5-02c5caf3a1e5	0	20	t	448c17fe-622b-45e6-b620-6732f0fa80f0	\N
dccfc819-221d-4070-bc4d-a238aa83fddc	\N	basic-auth	a499feb5-9be3-463d-8e41-bfa85aed27f4	448c17fe-622b-45e6-b620-6732f0fa80f0	0	10	f	\N	\N
584194bc-d15c-4a10-a17a-ef9731bb950b	\N	basic-auth-otp	a499feb5-9be3-463d-8e41-bfa85aed27f4	448c17fe-622b-45e6-b620-6732f0fa80f0	3	20	f	\N	\N
845f656b-9665-4ff1-8fc1-e7d21a89a65e	\N	auth-spnego	a499feb5-9be3-463d-8e41-bfa85aed27f4	448c17fe-622b-45e6-b620-6732f0fa80f0	3	30	f	\N	\N
8299a725-7f02-43a2-ac5f-cbbad406f6de	\N	idp-email-verification	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	38f65c0a-742a-413b-9d1c-4919a0b48803	2	10	f	\N	\N
a6b75d0d-d598-4365-8741-1b8f46f539d9	\N	\N	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	38f65c0a-742a-413b-9d1c-4919a0b48803	2	20	t	b64aef80-4ea5-42e6-b9bd-62bf67e06430	\N
0d6dcb7e-fe6c-405c-b655-df0d8ec8fbae	\N	basic-auth	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	5c347cce-c9db-4c26-9966-4b233b8da251	0	10	f	\N	\N
23093729-9041-4041-a00b-e45a2e35bda8	\N	basic-auth-otp	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	5c347cce-c9db-4c26-9966-4b233b8da251	3	20	f	\N	\N
bafa6bd7-1355-4c00-b708-5eeec0161d35	\N	auth-spnego	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	5c347cce-c9db-4c26-9966-4b233b8da251	3	30	f	\N	\N
ee3416fd-f0eb-446d-b364-8e3a6e85341a	\N	conditional-user-configured	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	6909d71d-eb26-42d0-9adc-482027107a2a	0	10	f	\N	\N
9dbc8dfd-48e2-4c61-8b1a-4cf251916c5b	\N	auth-otp-form	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	6909d71d-eb26-42d0-9adc-482027107a2a	0	20	f	\N	\N
caabc60e-ec39-4806-b2a4-6f258a9c5213	\N	conditional-user-configured	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	5b2dfef0-b265-4ad6-b048-f942c4cbfe1e	0	10	f	\N	\N
dcca3abd-2725-40f9-90ef-aa2256c2ce06	\N	direct-grant-validate-otp	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	5b2dfef0-b265-4ad6-b048-f942c4cbfe1e	0	20	f	\N	\N
f7446e0e-2fc5-4353-9ef8-25bf4d87b329	\N	conditional-user-configured	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	98bc47c0-e1c8-4426-913e-226e1f9d1240	0	10	f	\N	\N
07b28523-094d-4c85-ba31-badb47cb2343	\N	auth-otp-form	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	98bc47c0-e1c8-4426-913e-226e1f9d1240	0	20	f	\N	\N
6b0a519e-107e-4e05-b6b2-d99ccf010e92	\N	idp-confirm-link	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	cb08f4c9-824c-4923-add1-ecfdba2aa9f0	0	10	f	\N	\N
065e519b-37d1-48d3-a5e1-db8636875ffa	\N	\N	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	cb08f4c9-824c-4923-add1-ecfdba2aa9f0	0	20	t	38f65c0a-742a-413b-9d1c-4919a0b48803	\N
31649396-7d00-44af-a059-c7476184aa0b	\N	conditional-user-configured	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	10d6be50-b4de-4258-a46b-59c23ec7a9aa	0	10	f	\N	\N
aadcfecb-66dc-4e94-959f-bae01687090d	\N	reset-otp	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	10d6be50-b4de-4258-a46b-59c23ec7a9aa	0	20	f	\N	\N
82d9c2dd-c746-4558-9ef2-2fc13efabe33	\N	idp-create-user-if-unique	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	64ebbfad-fef5-429b-8b94-be5ad2bd98e3	2	10	f	\N	030a45f1-592b-40f8-9532-2f4ac8b3302f
810eda23-ab41-4a9e-9221-6a3b93753300	\N	\N	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	64ebbfad-fef5-429b-8b94-be5ad2bd98e3	2	20	t	cb08f4c9-824c-4923-add1-ecfdba2aa9f0	\N
b6127b73-4ed1-4c8a-bff0-6bea19a7c53b	\N	idp-username-password-form	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	b64aef80-4ea5-42e6-b9bd-62bf67e06430	0	10	f	\N	\N
407ed790-c990-4be0-9de4-d04084286ddf	\N	\N	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	b64aef80-4ea5-42e6-b9bd-62bf67e06430	1	20	t	98bc47c0-e1c8-4426-913e-226e1f9d1240	\N
cf64cfab-39da-4927-a011-eceff62fde81	\N	auth-cookie	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	2daf7423-29eb-4353-89b9-f65429a7060b	2	10	f	\N	\N
a1399da0-efc3-4772-a0c8-6dee5c068b81	\N	auth-spnego	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	2daf7423-29eb-4353-89b9-f65429a7060b	3	20	f	\N	\N
427d62a5-7b0c-4ad7-b15c-535eabceeb75	\N	identity-provider-redirector	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	2daf7423-29eb-4353-89b9-f65429a7060b	2	25	f	\N	\N
b04f1f13-e4fd-4663-bc36-b501e6ac2dda	\N	\N	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	2daf7423-29eb-4353-89b9-f65429a7060b	2	30	t	a2257ce2-b544-4ff6-be1c-3ff540756ed6	\N
c13c6df1-b5e0-487f-b6b9-7856cf5b2351	\N	client-secret	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	baf075fc-f8ab-4a57-8d55-f1d676379be6	2	10	f	\N	\N
af87265b-a505-4a1e-9f0e-1e8b672d6a3a	\N	client-jwt	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	baf075fc-f8ab-4a57-8d55-f1d676379be6	2	20	f	\N	\N
fd037f88-74e0-40d6-a1d6-2218e90a0442	\N	client-secret-jwt	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	baf075fc-f8ab-4a57-8d55-f1d676379be6	2	30	f	\N	\N
a446bebe-3cd2-43f6-b72a-d8457bdbe73e	\N	client-x509	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	baf075fc-f8ab-4a57-8d55-f1d676379be6	2	40	f	\N	\N
383dac28-e338-4923-945d-30ad74c72a2a	\N	direct-grant-validate-username	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	b76a2197-902a-4f31-b305-d2657f6aa68e	0	10	f	\N	\N
a35dca81-af39-44a2-bb7e-9eb76a93f573	\N	direct-grant-validate-password	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	b76a2197-902a-4f31-b305-d2657f6aa68e	0	20	f	\N	\N
f3e906f5-998c-4f76-acc8-ea8505554106	\N	\N	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	b76a2197-902a-4f31-b305-d2657f6aa68e	1	30	t	5b2dfef0-b265-4ad6-b048-f942c4cbfe1e	\N
bf6f5980-284a-436d-926a-79e33f6fdb27	\N	docker-http-basic-authenticator	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	b82128c1-e0ef-4b79-8be4-982b6912c0f0	0	10	f	\N	\N
75c946e7-2ade-403c-80ca-be8f8f0d20ee	\N	idp-review-profile	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	71a290dd-33c6-4cec-bb2f-9b5dc30b4fa7	0	10	f	\N	0c873b8b-08b2-4c7c-8fe2-5051c0e2eeba
0fce549a-cbba-4513-a980-731aa40828ab	\N	\N	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	71a290dd-33c6-4cec-bb2f-9b5dc30b4fa7	0	20	t	64ebbfad-fef5-429b-8b94-be5ad2bd98e3	\N
17f90327-20d3-4cd8-8804-11fe14950fe7	\N	auth-username-password-form	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	a2257ce2-b544-4ff6-be1c-3ff540756ed6	0	10	f	\N	\N
e1ca00aa-c4ab-4132-84d7-7b204597ddd2	\N	\N	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	a2257ce2-b544-4ff6-be1c-3ff540756ed6	1	20	t	6909d71d-eb26-42d0-9adc-482027107a2a	\N
8a751a66-8f49-4da5-9c0b-ae5d177b3456	\N	no-cookie-redirect	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	e1cad793-071b-4597-a01b-c2a8ef846053	0	10	f	\N	\N
a6375b7c-6934-46be-834f-7c1a84194745	\N	\N	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	e1cad793-071b-4597-a01b-c2a8ef846053	0	20	t	5c347cce-c9db-4c26-9966-4b233b8da251	\N
4ca46d16-f3d5-4f76-b5b7-93181a16a931	\N	registration-page-form	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fd042e85-027d-45fc-aa6e-fe2addb972ad	0	10	t	109483e8-246d-44bd-a45c-d8b0007f9b8e	\N
29c1fe14-744c-4a2e-b4b5-cb4b736e1e18	\N	registration-user-creation	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	109483e8-246d-44bd-a45c-d8b0007f9b8e	0	20	f	\N	\N
dad8c2da-449a-4bb9-bd27-180ab27ef050	\N	registration-profile-action	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	109483e8-246d-44bd-a45c-d8b0007f9b8e	0	40	f	\N	\N
074fa684-2c07-46f4-8481-66dbba23fd63	\N	registration-password-action	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	109483e8-246d-44bd-a45c-d8b0007f9b8e	0	50	f	\N	\N
ee98823d-2afe-42d3-aab4-e72df5757ec8	\N	registration-recaptcha-action	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	109483e8-246d-44bd-a45c-d8b0007f9b8e	3	60	f	\N	\N
3ac840ab-7d52-4871-b049-3a047abba470	\N	reset-credentials-choose-user	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	b46f6de2-41f4-4ac2-931c-1f197e9ac992	0	10	f	\N	\N
39d59ad6-e0b5-4701-81b1-4d5af765b275	\N	reset-credential-email	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	b46f6de2-41f4-4ac2-931c-1f197e9ac992	0	20	f	\N	\N
6301b6f1-b063-4aed-ac69-9f87d2b1fd2e	\N	reset-password	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	b46f6de2-41f4-4ac2-931c-1f197e9ac992	0	30	f	\N	\N
ad2fb5b2-a0e6-46ce-b3e0-a918e1aeb03d	\N	\N	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	b46f6de2-41f4-4ac2-931c-1f197e9ac992	1	40	t	10d6be50-b4de-4258-a46b-59c23ec7a9aa	\N
9a5d04b5-4f37-45d5-88e6-8021c70a28b8	\N	http-basic-authenticator	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	24b93bd7-b76a-433a-a76b-bbcf47c9a82b	0	10	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
e20eb133-0f06-4a2f-9b59-b8f319e8c4f8	browser	browser based authentication	a499feb5-9be3-463d-8e41-bfa85aed27f4	basic-flow	t	t
12569768-46d3-46d6-a6fc-7b4c1ca4fcdb	forms	Username, password, otp and other auth forms.	a499feb5-9be3-463d-8e41-bfa85aed27f4	basic-flow	f	t
037c589c-db50-40a3-a921-49df383f9a2f	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	a499feb5-9be3-463d-8e41-bfa85aed27f4	basic-flow	f	t
4fac46a7-24e7-4638-babf-d1267b1d563a	direct grant	OpenID Connect Resource Owner Grant	a499feb5-9be3-463d-8e41-bfa85aed27f4	basic-flow	t	t
dc759ad2-ead7-4d5b-a133-a5b235f5b181	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	a499feb5-9be3-463d-8e41-bfa85aed27f4	basic-flow	f	t
41c74f20-4b47-40a0-ba8f-6c3b6aea5599	registration	registration flow	a499feb5-9be3-463d-8e41-bfa85aed27f4	basic-flow	t	t
f1c64644-0083-4438-a42f-9bdda70e6c1c	registration form	registration form	a499feb5-9be3-463d-8e41-bfa85aed27f4	form-flow	f	t
d171b57a-4968-4b8d-9567-617140d10acc	reset credentials	Reset credentials for a user if they forgot their password or something	a499feb5-9be3-463d-8e41-bfa85aed27f4	basic-flow	t	t
0879163d-766d-4ca4-8519-f4fa22de4728	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	a499feb5-9be3-463d-8e41-bfa85aed27f4	basic-flow	f	t
34dd7d78-4d4c-4af6-9bb8-a126d2ca60b5	clients	Base authentication for clients	a499feb5-9be3-463d-8e41-bfa85aed27f4	client-flow	t	t
44c40e37-bd53-4038-ba87-9c34a9aae368	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	a499feb5-9be3-463d-8e41-bfa85aed27f4	basic-flow	t	t
6743d13e-cf10-4dea-af7e-94362e984054	User creation or linking	Flow for the existing/non-existing user alternatives	a499feb5-9be3-463d-8e41-bfa85aed27f4	basic-flow	f	t
a6efab51-73fe-401e-812f-a4b9e6c93a99	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	a499feb5-9be3-463d-8e41-bfa85aed27f4	basic-flow	f	t
31a79f58-2d7c-4572-88af-b85edc32a866	Account verification options	Method with which to verity the existing account	a499feb5-9be3-463d-8e41-bfa85aed27f4	basic-flow	f	t
f3168592-6556-442b-a248-393536cccbf7	Verify Existing Account by Re-authentication	Reauthentication of existing account	a499feb5-9be3-463d-8e41-bfa85aed27f4	basic-flow	f	t
4dea394d-1e77-4182-b332-8209ad41af29	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	a499feb5-9be3-463d-8e41-bfa85aed27f4	basic-flow	f	t
900234dc-2a4a-4572-a3f2-f112e433433b	saml ecp	SAML ECP Profile Authentication Flow	a499feb5-9be3-463d-8e41-bfa85aed27f4	basic-flow	t	t
5669316a-5f82-4cc6-8217-a645cb67b3f7	docker auth	Used by Docker clients to authenticate against the IDP	a499feb5-9be3-463d-8e41-bfa85aed27f4	basic-flow	t	t
48358105-a644-45b5-91c5-02c5caf3a1e5	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	a499feb5-9be3-463d-8e41-bfa85aed27f4	basic-flow	t	t
448c17fe-622b-45e6-b620-6732f0fa80f0	Authentication Options	Authentication options.	a499feb5-9be3-463d-8e41-bfa85aed27f4	basic-flow	f	t
38f65c0a-742a-413b-9d1c-4919a0b48803	Account verification options	Method with which to verity the existing account	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	f	t
5c347cce-c9db-4c26-9966-4b233b8da251	Authentication Options	Authentication options.	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	f	t
6909d71d-eb26-42d0-9adc-482027107a2a	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	f	t
5b2dfef0-b265-4ad6-b048-f942c4cbfe1e	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	f	t
98bc47c0-e1c8-4426-913e-226e1f9d1240	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	f	t
cb08f4c9-824c-4923-add1-ecfdba2aa9f0	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	f	t
10d6be50-b4de-4258-a46b-59c23ec7a9aa	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	f	t
64ebbfad-fef5-429b-8b94-be5ad2bd98e3	User creation or linking	Flow for the existing/non-existing user alternatives	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	f	t
b64aef80-4ea5-42e6-b9bd-62bf67e06430	Verify Existing Account by Re-authentication	Reauthentication of existing account	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	f	t
2daf7423-29eb-4353-89b9-f65429a7060b	browser	browser based authentication	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	t	t
baf075fc-f8ab-4a57-8d55-f1d676379be6	clients	Base authentication for clients	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	client-flow	t	t
b76a2197-902a-4f31-b305-d2657f6aa68e	direct grant	OpenID Connect Resource Owner Grant	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	t	t
b82128c1-e0ef-4b79-8be4-982b6912c0f0	docker auth	Used by Docker clients to authenticate against the IDP	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	t	t
71a290dd-33c6-4cec-bb2f-9b5dc30b4fa7	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	t	t
a2257ce2-b544-4ff6-be1c-3ff540756ed6	forms	Username, password, otp and other auth forms.	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	f	t
e1cad793-071b-4597-a01b-c2a8ef846053	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	t	t
fd042e85-027d-45fc-aa6e-fe2addb972ad	registration	registration flow	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	t	t
109483e8-246d-44bd-a45c-d8b0007f9b8e	registration form	registration form	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	form-flow	f	t
b46f6de2-41f4-4ac2-931c-1f197e9ac992	reset credentials	Reset credentials for a user if they forgot their password or something	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	t	t
24b93bd7-b76a-433a-a76b-bbcf47c9a82b	saml ecp	SAML ECP Profile Authentication Flow	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	basic-flow	t	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
f34def34-5308-4c7b-aad6-6900882cbf08	review profile config	a499feb5-9be3-463d-8e41-bfa85aed27f4
6cc61651-3ed4-4a8a-bcc2-bc2072806d94	create unique user config	a499feb5-9be3-463d-8e41-bfa85aed27f4
030a45f1-592b-40f8-9532-2f4ac8b3302f	create unique user config	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1
0c873b8b-08b2-4c7c-8fe2-5051c0e2eeba	review profile config	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
6cc61651-3ed4-4a8a-bcc2-bc2072806d94	false	require.password.update.after.registration
f34def34-5308-4c7b-aad6-6900882cbf08	missing	update.profile.on.first.login
030a45f1-592b-40f8-9532-2f4ac8b3302f	false	require.password.update.after.registration
0c873b8b-08b2-4c7c-8fe2-5051c0e2eeba	missing	update.profile.on.first.login
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
65d59271-d202-4383-9083-b9c879ae4a18	t	f	master-realm	0	f	\N	\N	t	\N	f	a499feb5-9be3-463d-8e41-bfa85aed27f4	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
4d8abee8-263e-48f7-ad64-e9f9f428cc28	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	a499feb5-9be3-463d-8e41-bfa85aed27f4	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
639e98fe-0dc7-430f-ab8b-f6cc61f0b6ee	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	a499feb5-9be3-463d-8e41-bfa85aed27f4	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
3ad50dbb-0371-4edd-9e4c-b46bf72206be	t	f	broker	0	f	\N	\N	t	\N	f	a499feb5-9be3-463d-8e41-bfa85aed27f4	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
94feba80-31ad-4ee0-8de3-1f4d35eba2e6	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	a499feb5-9be3-463d-8e41-bfa85aed27f4	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
589be3fb-750c-4efa-9a1f-80c4683cd9e4	t	f	admin-cli	0	t	\N	\N	f	\N	f	a499feb5-9be3-463d-8e41-bfa85aed27f4	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
a3001d8f-6f17-45cd-a850-5425fe9fc808	t	f	ecgvue-realm	0	f	\N	\N	t	\N	f	a499feb5-9be3-463d-8e41-bfa85aed27f4	\N	0	f	f	ecgvue Realm	f	client-secret	\N	\N	\N	t	f	f	f
ce842fe5-3812-4965-bd2a-223b37637c1d	t	f	account	0	t	\N	/realms/ecgvue/account/	f	\N	f	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
335fc954-d318-439c-a800-ec6890e7befc	t	f	account-console	0	t	\N	/realms/ecgvue/account/	f	\N	f	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
f1df2ff5-b9db-45ab-bae2-f9147cdb4ada	t	f	admin-cli	0	t	\N	\N	f	\N	f	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
0d4e2343-70bb-483a-ac8a-8c0ee9375046	t	f	broker	0	f	\N	\N	t	\N	f	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
fb57efd3-823f-4b3c-88ff-51e766fafefd	t	f	realm-management	0	f	\N	\N	t	\N	f	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
098636cc-5794-485f-ba91-8128deafe934	t	f	security-admin-console	0	t	\N	/admin/ecgvue/console/	f	\N	f	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	t	t	backend	0	f	mP84MTx2TPTWLrf9gVzyYoqsIMtnz1DS		f		f	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	openid-connect	-1	t	f	Backend	t	client-secret		Backend Description	\N	f	f	f	f
e03a9c44-332a-48cd-8777-d544fd7d3feb	t	t	frontend	0	t	\N		f		f	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	openid-connect	-1	f	f	Front End	f	client-secret		Front end For Angular access	\N	t	f	t	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
4d8abee8-263e-48f7-ad64-e9f9f428cc28	post.logout.redirect.uris	+
639e98fe-0dc7-430f-ab8b-f6cc61f0b6ee	post.logout.redirect.uris	+
639e98fe-0dc7-430f-ab8b-f6cc61f0b6ee	pkce.code.challenge.method	S256
94feba80-31ad-4ee0-8de3-1f4d35eba2e6	post.logout.redirect.uris	+
94feba80-31ad-4ee0-8de3-1f4d35eba2e6	pkce.code.challenge.method	S256
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	client.secret.creation.time	1694499732
ce842fe5-3812-4965-bd2a-223b37637c1d	post.logout.redirect.uris	+
335fc954-d318-439c-a800-ec6890e7befc	post.logout.redirect.uris	+
335fc954-d318-439c-a800-ec6890e7befc	pkce.code.challenge.method	S256
f1df2ff5-b9db-45ab-bae2-f9147cdb4ada	post.logout.redirect.uris	+
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	oidc.ciba.grant.enabled	false
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	backchannel.logout.session.required	true
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	post.logout.redirect.uris	+
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	display.on.consent.screen	false
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	oauth2.device.authorization.grant.enabled	false
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	backchannel.logout.revoke.offline.tokens	false
0d4e2343-70bb-483a-ac8a-8c0ee9375046	post.logout.redirect.uris	+
e03a9c44-332a-48cd-8777-d544fd7d3feb	oidc.ciba.grant.enabled	false
e03a9c44-332a-48cd-8777-d544fd7d3feb	backchannel.logout.session.required	true
e03a9c44-332a-48cd-8777-d544fd7d3feb	consent.screen.text	This is a temporary message.
e03a9c44-332a-48cd-8777-d544fd7d3feb	login_theme	ecgvue-theme
e03a9c44-332a-48cd-8777-d544fd7d3feb	post.logout.redirect.uris	+
e03a9c44-332a-48cd-8777-d544fd7d3feb	display.on.consent.screen	true
e03a9c44-332a-48cd-8777-d544fd7d3feb	oauth2.device.authorization.grant.enabled	false
e03a9c44-332a-48cd-8777-d544fd7d3feb	backchannel.logout.revoke.offline.tokens	false
fb57efd3-823f-4b3c-88ff-51e766fafefd	post.logout.redirect.uris	+
098636cc-5794-485f-ba91-8128deafe934	post.logout.redirect.uris	+
098636cc-5794-485f-ba91-8128deafe934	pkce.code.challenge.method	S256
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
0545b5ca-6590-4d11-a33a-2f39c123cf25	offline_access	a499feb5-9be3-463d-8e41-bfa85aed27f4	OpenID Connect built-in scope: offline_access	openid-connect
e9e51bde-fec7-44b1-a23d-123f0dcd16a8	role_list	a499feb5-9be3-463d-8e41-bfa85aed27f4	SAML role list	saml
ea6a3813-0f00-4f50-b344-16caaed12d47	profile	a499feb5-9be3-463d-8e41-bfa85aed27f4	OpenID Connect built-in scope: profile	openid-connect
b6cf459a-f075-4d31-8945-75c1eb35d783	email	a499feb5-9be3-463d-8e41-bfa85aed27f4	OpenID Connect built-in scope: email	openid-connect
843efda5-081d-4bfd-8cab-b7c2328fc311	address	a499feb5-9be3-463d-8e41-bfa85aed27f4	OpenID Connect built-in scope: address	openid-connect
3ea530f7-8b0f-40fa-964a-f9f9ec93c326	phone	a499feb5-9be3-463d-8e41-bfa85aed27f4	OpenID Connect built-in scope: phone	openid-connect
11a1b916-47fe-4094-bc38-be06b14dfed8	roles	a499feb5-9be3-463d-8e41-bfa85aed27f4	OpenID Connect scope for add user roles to the access token	openid-connect
7ec167f3-226b-44af-a4c3-8f0b45c1eeac	web-origins	a499feb5-9be3-463d-8e41-bfa85aed27f4	OpenID Connect scope for add allowed web origins to the access token	openid-connect
7d05b1cc-925a-4e26-82ec-93c8241cc4e9	microprofile-jwt	a499feb5-9be3-463d-8e41-bfa85aed27f4	Microprofile - JWT built-in scope	openid-connect
460c4b11-54de-451c-9d9b-38c7f950d129	acr	a499feb5-9be3-463d-8e41-bfa85aed27f4	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
0a18b98d-38e5-44d2-9332-1065b0c342dc	acr	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
d24e8e94-f3ca-47d4-bb18-dd8ba81d1124	offline_access	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	OpenID Connect built-in scope: offline_access	openid-connect
474bd65f-db29-470c-a9c3-3ad8f8615a6f	web-origins	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	OpenID Connect scope for add allowed web origins to the access token	openid-connect
d33b511f-1df4-4f3a-b4fd-8e7e0403f908	phone	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	OpenID Connect built-in scope: phone	openid-connect
43869505-7a24-424e-9ada-0cef970169a5	profile	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	OpenID Connect built-in scope: profile	openid-connect
111caa50-b290-43a8-b04a-cce3c73dbefa	email	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	OpenID Connect built-in scope: email	openid-connect
1c24bfe0-68ec-457a-8fb9-8f6fccde0ba5	role_list	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	SAML role list	saml
29945782-f537-4661-beb2-eb77c9d23669	microprofile-jwt	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	Microprofile - JWT built-in scope	openid-connect
d5d707c6-4d4f-4bc9-8a5b-4e089040061d	roles	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	OpenID Connect scope for add user roles to the access token	openid-connect
a86d5100-8b35-49e9-94c3-3952256a2ffc	address	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	OpenID Connect built-in scope: address	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
0545b5ca-6590-4d11-a33a-2f39c123cf25	true	display.on.consent.screen
0545b5ca-6590-4d11-a33a-2f39c123cf25	${offlineAccessScopeConsentText}	consent.screen.text
e9e51bde-fec7-44b1-a23d-123f0dcd16a8	true	display.on.consent.screen
e9e51bde-fec7-44b1-a23d-123f0dcd16a8	${samlRoleListScopeConsentText}	consent.screen.text
ea6a3813-0f00-4f50-b344-16caaed12d47	true	display.on.consent.screen
ea6a3813-0f00-4f50-b344-16caaed12d47	${profileScopeConsentText}	consent.screen.text
ea6a3813-0f00-4f50-b344-16caaed12d47	true	include.in.token.scope
b6cf459a-f075-4d31-8945-75c1eb35d783	true	display.on.consent.screen
b6cf459a-f075-4d31-8945-75c1eb35d783	${emailScopeConsentText}	consent.screen.text
b6cf459a-f075-4d31-8945-75c1eb35d783	true	include.in.token.scope
843efda5-081d-4bfd-8cab-b7c2328fc311	true	display.on.consent.screen
843efda5-081d-4bfd-8cab-b7c2328fc311	${addressScopeConsentText}	consent.screen.text
843efda5-081d-4bfd-8cab-b7c2328fc311	true	include.in.token.scope
3ea530f7-8b0f-40fa-964a-f9f9ec93c326	true	display.on.consent.screen
3ea530f7-8b0f-40fa-964a-f9f9ec93c326	${phoneScopeConsentText}	consent.screen.text
3ea530f7-8b0f-40fa-964a-f9f9ec93c326	true	include.in.token.scope
11a1b916-47fe-4094-bc38-be06b14dfed8	true	display.on.consent.screen
11a1b916-47fe-4094-bc38-be06b14dfed8	${rolesScopeConsentText}	consent.screen.text
11a1b916-47fe-4094-bc38-be06b14dfed8	false	include.in.token.scope
7ec167f3-226b-44af-a4c3-8f0b45c1eeac	false	display.on.consent.screen
7ec167f3-226b-44af-a4c3-8f0b45c1eeac		consent.screen.text
7ec167f3-226b-44af-a4c3-8f0b45c1eeac	false	include.in.token.scope
7d05b1cc-925a-4e26-82ec-93c8241cc4e9	false	display.on.consent.screen
7d05b1cc-925a-4e26-82ec-93c8241cc4e9	true	include.in.token.scope
460c4b11-54de-451c-9d9b-38c7f950d129	false	display.on.consent.screen
460c4b11-54de-451c-9d9b-38c7f950d129	false	include.in.token.scope
111caa50-b290-43a8-b04a-cce3c73dbefa	true	include.in.token.scope
111caa50-b290-43a8-b04a-cce3c73dbefa	true	display.on.consent.screen
111caa50-b290-43a8-b04a-cce3c73dbefa	${emailScopeConsentText}	consent.screen.text
1c24bfe0-68ec-457a-8fb9-8f6fccde0ba5	${samlRoleListScopeConsentText}	consent.screen.text
1c24bfe0-68ec-457a-8fb9-8f6fccde0ba5	true	display.on.consent.screen
0a18b98d-38e5-44d2-9332-1065b0c342dc	false	include.in.token.scope
0a18b98d-38e5-44d2-9332-1065b0c342dc	false	display.on.consent.screen
d24e8e94-f3ca-47d4-bb18-dd8ba81d1124	${offlineAccessScopeConsentText}	consent.screen.text
d24e8e94-f3ca-47d4-bb18-dd8ba81d1124	true	display.on.consent.screen
474bd65f-db29-470c-a9c3-3ad8f8615a6f	false	include.in.token.scope
474bd65f-db29-470c-a9c3-3ad8f8615a6f	false	display.on.consent.screen
474bd65f-db29-470c-a9c3-3ad8f8615a6f		consent.screen.text
d33b511f-1df4-4f3a-b4fd-8e7e0403f908	true	include.in.token.scope
d33b511f-1df4-4f3a-b4fd-8e7e0403f908	true	display.on.consent.screen
d33b511f-1df4-4f3a-b4fd-8e7e0403f908	${phoneScopeConsentText}	consent.screen.text
43869505-7a24-424e-9ada-0cef970169a5	true	include.in.token.scope
43869505-7a24-424e-9ada-0cef970169a5	true	display.on.consent.screen
43869505-7a24-424e-9ada-0cef970169a5	${profileScopeConsentText}	consent.screen.text
29945782-f537-4661-beb2-eb77c9d23669	true	include.in.token.scope
29945782-f537-4661-beb2-eb77c9d23669	false	display.on.consent.screen
d5d707c6-4d4f-4bc9-8a5b-4e089040061d	false	include.in.token.scope
d5d707c6-4d4f-4bc9-8a5b-4e089040061d	true	display.on.consent.screen
d5d707c6-4d4f-4bc9-8a5b-4e089040061d	${rolesScopeConsentText}	consent.screen.text
a86d5100-8b35-49e9-94c3-3952256a2ffc	true	include.in.token.scope
a86d5100-8b35-49e9-94c3-3952256a2ffc	true	display.on.consent.screen
a86d5100-8b35-49e9-94c3-3952256a2ffc	${addressScopeConsentText}	consent.screen.text
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
4d8abee8-263e-48f7-ad64-e9f9f428cc28	ea6a3813-0f00-4f50-b344-16caaed12d47	t
4d8abee8-263e-48f7-ad64-e9f9f428cc28	11a1b916-47fe-4094-bc38-be06b14dfed8	t
4d8abee8-263e-48f7-ad64-e9f9f428cc28	460c4b11-54de-451c-9d9b-38c7f950d129	t
4d8abee8-263e-48f7-ad64-e9f9f428cc28	7ec167f3-226b-44af-a4c3-8f0b45c1eeac	t
4d8abee8-263e-48f7-ad64-e9f9f428cc28	b6cf459a-f075-4d31-8945-75c1eb35d783	t
4d8abee8-263e-48f7-ad64-e9f9f428cc28	0545b5ca-6590-4d11-a33a-2f39c123cf25	f
4d8abee8-263e-48f7-ad64-e9f9f428cc28	843efda5-081d-4bfd-8cab-b7c2328fc311	f
4d8abee8-263e-48f7-ad64-e9f9f428cc28	3ea530f7-8b0f-40fa-964a-f9f9ec93c326	f
4d8abee8-263e-48f7-ad64-e9f9f428cc28	7d05b1cc-925a-4e26-82ec-93c8241cc4e9	f
639e98fe-0dc7-430f-ab8b-f6cc61f0b6ee	ea6a3813-0f00-4f50-b344-16caaed12d47	t
639e98fe-0dc7-430f-ab8b-f6cc61f0b6ee	11a1b916-47fe-4094-bc38-be06b14dfed8	t
639e98fe-0dc7-430f-ab8b-f6cc61f0b6ee	460c4b11-54de-451c-9d9b-38c7f950d129	t
639e98fe-0dc7-430f-ab8b-f6cc61f0b6ee	7ec167f3-226b-44af-a4c3-8f0b45c1eeac	t
639e98fe-0dc7-430f-ab8b-f6cc61f0b6ee	b6cf459a-f075-4d31-8945-75c1eb35d783	t
639e98fe-0dc7-430f-ab8b-f6cc61f0b6ee	0545b5ca-6590-4d11-a33a-2f39c123cf25	f
639e98fe-0dc7-430f-ab8b-f6cc61f0b6ee	843efda5-081d-4bfd-8cab-b7c2328fc311	f
639e98fe-0dc7-430f-ab8b-f6cc61f0b6ee	3ea530f7-8b0f-40fa-964a-f9f9ec93c326	f
639e98fe-0dc7-430f-ab8b-f6cc61f0b6ee	7d05b1cc-925a-4e26-82ec-93c8241cc4e9	f
589be3fb-750c-4efa-9a1f-80c4683cd9e4	ea6a3813-0f00-4f50-b344-16caaed12d47	t
589be3fb-750c-4efa-9a1f-80c4683cd9e4	11a1b916-47fe-4094-bc38-be06b14dfed8	t
589be3fb-750c-4efa-9a1f-80c4683cd9e4	460c4b11-54de-451c-9d9b-38c7f950d129	t
589be3fb-750c-4efa-9a1f-80c4683cd9e4	7ec167f3-226b-44af-a4c3-8f0b45c1eeac	t
589be3fb-750c-4efa-9a1f-80c4683cd9e4	b6cf459a-f075-4d31-8945-75c1eb35d783	t
589be3fb-750c-4efa-9a1f-80c4683cd9e4	0545b5ca-6590-4d11-a33a-2f39c123cf25	f
589be3fb-750c-4efa-9a1f-80c4683cd9e4	843efda5-081d-4bfd-8cab-b7c2328fc311	f
589be3fb-750c-4efa-9a1f-80c4683cd9e4	3ea530f7-8b0f-40fa-964a-f9f9ec93c326	f
589be3fb-750c-4efa-9a1f-80c4683cd9e4	7d05b1cc-925a-4e26-82ec-93c8241cc4e9	f
3ad50dbb-0371-4edd-9e4c-b46bf72206be	ea6a3813-0f00-4f50-b344-16caaed12d47	t
3ad50dbb-0371-4edd-9e4c-b46bf72206be	11a1b916-47fe-4094-bc38-be06b14dfed8	t
3ad50dbb-0371-4edd-9e4c-b46bf72206be	460c4b11-54de-451c-9d9b-38c7f950d129	t
3ad50dbb-0371-4edd-9e4c-b46bf72206be	7ec167f3-226b-44af-a4c3-8f0b45c1eeac	t
3ad50dbb-0371-4edd-9e4c-b46bf72206be	b6cf459a-f075-4d31-8945-75c1eb35d783	t
3ad50dbb-0371-4edd-9e4c-b46bf72206be	0545b5ca-6590-4d11-a33a-2f39c123cf25	f
3ad50dbb-0371-4edd-9e4c-b46bf72206be	843efda5-081d-4bfd-8cab-b7c2328fc311	f
3ad50dbb-0371-4edd-9e4c-b46bf72206be	3ea530f7-8b0f-40fa-964a-f9f9ec93c326	f
3ad50dbb-0371-4edd-9e4c-b46bf72206be	7d05b1cc-925a-4e26-82ec-93c8241cc4e9	f
65d59271-d202-4383-9083-b9c879ae4a18	ea6a3813-0f00-4f50-b344-16caaed12d47	t
65d59271-d202-4383-9083-b9c879ae4a18	11a1b916-47fe-4094-bc38-be06b14dfed8	t
65d59271-d202-4383-9083-b9c879ae4a18	460c4b11-54de-451c-9d9b-38c7f950d129	t
65d59271-d202-4383-9083-b9c879ae4a18	7ec167f3-226b-44af-a4c3-8f0b45c1eeac	t
65d59271-d202-4383-9083-b9c879ae4a18	b6cf459a-f075-4d31-8945-75c1eb35d783	t
65d59271-d202-4383-9083-b9c879ae4a18	0545b5ca-6590-4d11-a33a-2f39c123cf25	f
65d59271-d202-4383-9083-b9c879ae4a18	843efda5-081d-4bfd-8cab-b7c2328fc311	f
65d59271-d202-4383-9083-b9c879ae4a18	3ea530f7-8b0f-40fa-964a-f9f9ec93c326	f
65d59271-d202-4383-9083-b9c879ae4a18	7d05b1cc-925a-4e26-82ec-93c8241cc4e9	f
94feba80-31ad-4ee0-8de3-1f4d35eba2e6	ea6a3813-0f00-4f50-b344-16caaed12d47	t
94feba80-31ad-4ee0-8de3-1f4d35eba2e6	11a1b916-47fe-4094-bc38-be06b14dfed8	t
94feba80-31ad-4ee0-8de3-1f4d35eba2e6	460c4b11-54de-451c-9d9b-38c7f950d129	t
94feba80-31ad-4ee0-8de3-1f4d35eba2e6	7ec167f3-226b-44af-a4c3-8f0b45c1eeac	t
94feba80-31ad-4ee0-8de3-1f4d35eba2e6	b6cf459a-f075-4d31-8945-75c1eb35d783	t
94feba80-31ad-4ee0-8de3-1f4d35eba2e6	0545b5ca-6590-4d11-a33a-2f39c123cf25	f
94feba80-31ad-4ee0-8de3-1f4d35eba2e6	843efda5-081d-4bfd-8cab-b7c2328fc311	f
94feba80-31ad-4ee0-8de3-1f4d35eba2e6	3ea530f7-8b0f-40fa-964a-f9f9ec93c326	f
94feba80-31ad-4ee0-8de3-1f4d35eba2e6	7d05b1cc-925a-4e26-82ec-93c8241cc4e9	f
ce842fe5-3812-4965-bd2a-223b37637c1d	474bd65f-db29-470c-a9c3-3ad8f8615a6f	t
ce842fe5-3812-4965-bd2a-223b37637c1d	0a18b98d-38e5-44d2-9332-1065b0c342dc	t
ce842fe5-3812-4965-bd2a-223b37637c1d	43869505-7a24-424e-9ada-0cef970169a5	t
ce842fe5-3812-4965-bd2a-223b37637c1d	d5d707c6-4d4f-4bc9-8a5b-4e089040061d	t
ce842fe5-3812-4965-bd2a-223b37637c1d	111caa50-b290-43a8-b04a-cce3c73dbefa	t
ce842fe5-3812-4965-bd2a-223b37637c1d	a86d5100-8b35-49e9-94c3-3952256a2ffc	f
ce842fe5-3812-4965-bd2a-223b37637c1d	d33b511f-1df4-4f3a-b4fd-8e7e0403f908	f
ce842fe5-3812-4965-bd2a-223b37637c1d	d24e8e94-f3ca-47d4-bb18-dd8ba81d1124	f
ce842fe5-3812-4965-bd2a-223b37637c1d	29945782-f537-4661-beb2-eb77c9d23669	f
335fc954-d318-439c-a800-ec6890e7befc	474bd65f-db29-470c-a9c3-3ad8f8615a6f	t
335fc954-d318-439c-a800-ec6890e7befc	0a18b98d-38e5-44d2-9332-1065b0c342dc	t
335fc954-d318-439c-a800-ec6890e7befc	43869505-7a24-424e-9ada-0cef970169a5	t
335fc954-d318-439c-a800-ec6890e7befc	d5d707c6-4d4f-4bc9-8a5b-4e089040061d	t
335fc954-d318-439c-a800-ec6890e7befc	111caa50-b290-43a8-b04a-cce3c73dbefa	t
335fc954-d318-439c-a800-ec6890e7befc	a86d5100-8b35-49e9-94c3-3952256a2ffc	f
335fc954-d318-439c-a800-ec6890e7befc	d33b511f-1df4-4f3a-b4fd-8e7e0403f908	f
335fc954-d318-439c-a800-ec6890e7befc	d24e8e94-f3ca-47d4-bb18-dd8ba81d1124	f
335fc954-d318-439c-a800-ec6890e7befc	29945782-f537-4661-beb2-eb77c9d23669	f
f1df2ff5-b9db-45ab-bae2-f9147cdb4ada	474bd65f-db29-470c-a9c3-3ad8f8615a6f	t
f1df2ff5-b9db-45ab-bae2-f9147cdb4ada	0a18b98d-38e5-44d2-9332-1065b0c342dc	t
f1df2ff5-b9db-45ab-bae2-f9147cdb4ada	43869505-7a24-424e-9ada-0cef970169a5	t
f1df2ff5-b9db-45ab-bae2-f9147cdb4ada	d5d707c6-4d4f-4bc9-8a5b-4e089040061d	t
f1df2ff5-b9db-45ab-bae2-f9147cdb4ada	111caa50-b290-43a8-b04a-cce3c73dbefa	t
f1df2ff5-b9db-45ab-bae2-f9147cdb4ada	a86d5100-8b35-49e9-94c3-3952256a2ffc	f
f1df2ff5-b9db-45ab-bae2-f9147cdb4ada	d33b511f-1df4-4f3a-b4fd-8e7e0403f908	f
f1df2ff5-b9db-45ab-bae2-f9147cdb4ada	d24e8e94-f3ca-47d4-bb18-dd8ba81d1124	f
f1df2ff5-b9db-45ab-bae2-f9147cdb4ada	29945782-f537-4661-beb2-eb77c9d23669	f
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	474bd65f-db29-470c-a9c3-3ad8f8615a6f	t
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	0a18b98d-38e5-44d2-9332-1065b0c342dc	t
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	43869505-7a24-424e-9ada-0cef970169a5	t
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	d5d707c6-4d4f-4bc9-8a5b-4e089040061d	t
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	111caa50-b290-43a8-b04a-cce3c73dbefa	t
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	a86d5100-8b35-49e9-94c3-3952256a2ffc	f
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	d33b511f-1df4-4f3a-b4fd-8e7e0403f908	f
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	d24e8e94-f3ca-47d4-bb18-dd8ba81d1124	f
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	29945782-f537-4661-beb2-eb77c9d23669	f
0d4e2343-70bb-483a-ac8a-8c0ee9375046	474bd65f-db29-470c-a9c3-3ad8f8615a6f	t
0d4e2343-70bb-483a-ac8a-8c0ee9375046	0a18b98d-38e5-44d2-9332-1065b0c342dc	t
0d4e2343-70bb-483a-ac8a-8c0ee9375046	43869505-7a24-424e-9ada-0cef970169a5	t
0d4e2343-70bb-483a-ac8a-8c0ee9375046	d5d707c6-4d4f-4bc9-8a5b-4e089040061d	t
0d4e2343-70bb-483a-ac8a-8c0ee9375046	111caa50-b290-43a8-b04a-cce3c73dbefa	t
0d4e2343-70bb-483a-ac8a-8c0ee9375046	a86d5100-8b35-49e9-94c3-3952256a2ffc	f
0d4e2343-70bb-483a-ac8a-8c0ee9375046	d33b511f-1df4-4f3a-b4fd-8e7e0403f908	f
0d4e2343-70bb-483a-ac8a-8c0ee9375046	d24e8e94-f3ca-47d4-bb18-dd8ba81d1124	f
0d4e2343-70bb-483a-ac8a-8c0ee9375046	29945782-f537-4661-beb2-eb77c9d23669	f
e03a9c44-332a-48cd-8777-d544fd7d3feb	474bd65f-db29-470c-a9c3-3ad8f8615a6f	t
e03a9c44-332a-48cd-8777-d544fd7d3feb	0a18b98d-38e5-44d2-9332-1065b0c342dc	t
e03a9c44-332a-48cd-8777-d544fd7d3feb	43869505-7a24-424e-9ada-0cef970169a5	t
e03a9c44-332a-48cd-8777-d544fd7d3feb	d5d707c6-4d4f-4bc9-8a5b-4e089040061d	t
e03a9c44-332a-48cd-8777-d544fd7d3feb	111caa50-b290-43a8-b04a-cce3c73dbefa	t
e03a9c44-332a-48cd-8777-d544fd7d3feb	a86d5100-8b35-49e9-94c3-3952256a2ffc	f
e03a9c44-332a-48cd-8777-d544fd7d3feb	d33b511f-1df4-4f3a-b4fd-8e7e0403f908	f
e03a9c44-332a-48cd-8777-d544fd7d3feb	d24e8e94-f3ca-47d4-bb18-dd8ba81d1124	f
e03a9c44-332a-48cd-8777-d544fd7d3feb	29945782-f537-4661-beb2-eb77c9d23669	f
fb57efd3-823f-4b3c-88ff-51e766fafefd	474bd65f-db29-470c-a9c3-3ad8f8615a6f	t
fb57efd3-823f-4b3c-88ff-51e766fafefd	0a18b98d-38e5-44d2-9332-1065b0c342dc	t
fb57efd3-823f-4b3c-88ff-51e766fafefd	43869505-7a24-424e-9ada-0cef970169a5	t
fb57efd3-823f-4b3c-88ff-51e766fafefd	d5d707c6-4d4f-4bc9-8a5b-4e089040061d	t
fb57efd3-823f-4b3c-88ff-51e766fafefd	111caa50-b290-43a8-b04a-cce3c73dbefa	t
fb57efd3-823f-4b3c-88ff-51e766fafefd	a86d5100-8b35-49e9-94c3-3952256a2ffc	f
fb57efd3-823f-4b3c-88ff-51e766fafefd	d33b511f-1df4-4f3a-b4fd-8e7e0403f908	f
fb57efd3-823f-4b3c-88ff-51e766fafefd	d24e8e94-f3ca-47d4-bb18-dd8ba81d1124	f
fb57efd3-823f-4b3c-88ff-51e766fafefd	29945782-f537-4661-beb2-eb77c9d23669	f
098636cc-5794-485f-ba91-8128deafe934	474bd65f-db29-470c-a9c3-3ad8f8615a6f	t
098636cc-5794-485f-ba91-8128deafe934	0a18b98d-38e5-44d2-9332-1065b0c342dc	t
098636cc-5794-485f-ba91-8128deafe934	43869505-7a24-424e-9ada-0cef970169a5	t
098636cc-5794-485f-ba91-8128deafe934	d5d707c6-4d4f-4bc9-8a5b-4e089040061d	t
098636cc-5794-485f-ba91-8128deafe934	111caa50-b290-43a8-b04a-cce3c73dbefa	t
098636cc-5794-485f-ba91-8128deafe934	a86d5100-8b35-49e9-94c3-3952256a2ffc	f
098636cc-5794-485f-ba91-8128deafe934	d33b511f-1df4-4f3a-b4fd-8e7e0403f908	f
098636cc-5794-485f-ba91-8128deafe934	d24e8e94-f3ca-47d4-bb18-dd8ba81d1124	f
098636cc-5794-485f-ba91-8128deafe934	29945782-f537-4661-beb2-eb77c9d23669	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
0545b5ca-6590-4d11-a33a-2f39c123cf25	a899d539-c897-45c8-9174-7377a1661c44
d24e8e94-f3ca-47d4-bb18-dd8ba81d1124	745167cf-3a7e-4302-9027-f7ec388b2fa2
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
51134660-8893-492a-9250-359db11d1cd3	Trusted Hosts	a499feb5-9be3-463d-8e41-bfa85aed27f4	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a499feb5-9be3-463d-8e41-bfa85aed27f4	anonymous
aa07c03e-76bf-4495-aad5-c9c6fd6ef154	Consent Required	a499feb5-9be3-463d-8e41-bfa85aed27f4	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a499feb5-9be3-463d-8e41-bfa85aed27f4	anonymous
cc8a44ba-2798-4457-9307-cbad81eff7e7	Full Scope Disabled	a499feb5-9be3-463d-8e41-bfa85aed27f4	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a499feb5-9be3-463d-8e41-bfa85aed27f4	anonymous
74933e9c-2853-4dfa-98d3-888c6d1bec05	Max Clients Limit	a499feb5-9be3-463d-8e41-bfa85aed27f4	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a499feb5-9be3-463d-8e41-bfa85aed27f4	anonymous
cbc574b0-e00d-434d-85be-3cbf46c9be45	Allowed Protocol Mapper Types	a499feb5-9be3-463d-8e41-bfa85aed27f4	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a499feb5-9be3-463d-8e41-bfa85aed27f4	anonymous
c1c10cf6-6de3-4abf-9c10-22b4802e6502	Allowed Client Scopes	a499feb5-9be3-463d-8e41-bfa85aed27f4	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a499feb5-9be3-463d-8e41-bfa85aed27f4	anonymous
f34801db-403d-400f-9d8f-74b5537add03	Allowed Protocol Mapper Types	a499feb5-9be3-463d-8e41-bfa85aed27f4	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a499feb5-9be3-463d-8e41-bfa85aed27f4	authenticated
61b4f298-2f59-481e-9943-16cdbebcea3e	Allowed Client Scopes	a499feb5-9be3-463d-8e41-bfa85aed27f4	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	a499feb5-9be3-463d-8e41-bfa85aed27f4	authenticated
29e4f6af-cfac-409d-851a-d22ec7874690	rsa-generated	a499feb5-9be3-463d-8e41-bfa85aed27f4	rsa-generated	org.keycloak.keys.KeyProvider	a499feb5-9be3-463d-8e41-bfa85aed27f4	\N
22d6b82f-ab6f-457c-8339-65179a98e754	rsa-enc-generated	a499feb5-9be3-463d-8e41-bfa85aed27f4	rsa-enc-generated	org.keycloak.keys.KeyProvider	a499feb5-9be3-463d-8e41-bfa85aed27f4	\N
3911206c-0dea-4f85-84fd-93f7f131461c	hmac-generated	a499feb5-9be3-463d-8e41-bfa85aed27f4	hmac-generated	org.keycloak.keys.KeyProvider	a499feb5-9be3-463d-8e41-bfa85aed27f4	\N
74714c68-583f-4483-9b76-4782ff308378	aes-generated	a499feb5-9be3-463d-8e41-bfa85aed27f4	aes-generated	org.keycloak.keys.KeyProvider	a499feb5-9be3-463d-8e41-bfa85aed27f4	\N
841ff175-dd04-4e65-854b-f5f0afca42eb	Consent Required	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	anonymous
7b3aa2e9-8112-4125-b57f-a8e6396be8d1	Full Scope Disabled	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	anonymous
a290fbe9-b211-471d-a6d4-de173fc740b9	Max Clients Limit	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	anonymous
487c1b4f-1a6d-40fe-9be7-a849a717e631	Allowed Protocol Mapper Types	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	anonymous
819bce71-0a61-4072-9753-e60632c9feac	Allowed Client Scopes	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	anonymous
faa64ebd-a4cd-41b9-9c29-b6653cddfa30	Allowed Protocol Mapper Types	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	authenticated
2e7b1c1f-7823-4343-9030-937eaac1dfd1	Allowed Client Scopes	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	authenticated
9d1f5d48-3b6f-4ffd-9651-9f327d8d0c12	Trusted Hosts	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	anonymous
39397f40-c828-4059-95a5-bc9a6de49528	aes-generated	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	aes-generated	org.keycloak.keys.KeyProvider	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N
1194761a-e76e-4090-b291-9208c2c5ce75	rsa-generated	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	rsa-generated	org.keycloak.keys.KeyProvider	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N
c489b84a-9833-4c39-a20f-765dc8aaecf7	hmac-generated	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	hmac-generated	org.keycloak.keys.KeyProvider	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N
da220a1c-3078-4d86-bf16-71923c3858e5	rsa-enc-generated	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	rsa-enc-generated	org.keycloak.keys.KeyProvider	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
f3eeb551-c789-4cfd-bfb9-9a254723cef3	c1c10cf6-6de3-4abf-9c10-22b4802e6502	allow-default-scopes	true
a8be5070-1253-44cf-bf49-49cbaf09d316	61b4f298-2f59-481e-9943-16cdbebcea3e	allow-default-scopes	true
cd039632-9639-44da-961f-b5965071c824	f34801db-403d-400f-9d8f-74b5537add03	allowed-protocol-mapper-types	saml-user-property-mapper
95a4a965-9103-4661-97ed-ee0d14b6442e	f34801db-403d-400f-9d8f-74b5537add03	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
d4c550c5-d836-4d02-88c3-b6d409248c40	f34801db-403d-400f-9d8f-74b5537add03	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
723965cd-f513-4276-94af-fb20a2e869c4	f34801db-403d-400f-9d8f-74b5537add03	allowed-protocol-mapper-types	saml-user-attribute-mapper
14e54f5c-c3ca-46a5-a3f2-54d92a07d7f1	f34801db-403d-400f-9d8f-74b5537add03	allowed-protocol-mapper-types	oidc-address-mapper
c96e4c94-ed7d-4242-8b8d-463926cd10cd	f34801db-403d-400f-9d8f-74b5537add03	allowed-protocol-mapper-types	saml-role-list-mapper
d7e2124c-3533-4e79-8f75-a8c2bd276ea0	f34801db-403d-400f-9d8f-74b5537add03	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
dec24fbb-e7d8-49f8-a7da-67e614d8e10a	f34801db-403d-400f-9d8f-74b5537add03	allowed-protocol-mapper-types	oidc-full-name-mapper
51384ce6-9441-4f6d-9ef7-03d4c67cc55d	74933e9c-2853-4dfa-98d3-888c6d1bec05	max-clients	200
db2e6eda-c34b-4d62-b11f-a700e2b5ed50	51134660-8893-492a-9250-359db11d1cd3	host-sending-registration-request-must-match	true
e927ec59-851f-4501-bc1f-86f05cbd7aee	51134660-8893-492a-9250-359db11d1cd3	client-uris-must-match	true
4c28f8e2-4d5a-4905-9a6d-b20d170bf777	cbc574b0-e00d-434d-85be-3cbf46c9be45	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
adf8ea2a-b632-4d27-b8db-c42ed1c48302	cbc574b0-e00d-434d-85be-3cbf46c9be45	allowed-protocol-mapper-types	oidc-address-mapper
07be1734-f097-406b-8199-dbc8bee40e04	cbc574b0-e00d-434d-85be-3cbf46c9be45	allowed-protocol-mapper-types	saml-role-list-mapper
1567a676-9833-4307-84c0-5503f3a1c6ad	cbc574b0-e00d-434d-85be-3cbf46c9be45	allowed-protocol-mapper-types	oidc-full-name-mapper
d3380562-d430-4f9f-92f1-447e926113fa	cbc574b0-e00d-434d-85be-3cbf46c9be45	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
e6a94ac4-7517-45d2-8565-19d5e19e41fb	cbc574b0-e00d-434d-85be-3cbf46c9be45	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
879cf17b-86a0-4919-a808-3e4ced9bbc67	cbc574b0-e00d-434d-85be-3cbf46c9be45	allowed-protocol-mapper-types	saml-user-attribute-mapper
b6407d6e-5514-4785-9bd1-57586db49f10	cbc574b0-e00d-434d-85be-3cbf46c9be45	allowed-protocol-mapper-types	saml-user-property-mapper
e37e2041-6d9a-4a02-8bd3-ba434e8d08db	3911206c-0dea-4f85-84fd-93f7f131461c	kid	ac9522ea-13c9-4c7c-b784-2f5241765b71
528ae7f7-5900-4cf4-9957-6aea158b80d6	3911206c-0dea-4f85-84fd-93f7f131461c	algorithm	HS256
dcd738d2-b681-489e-abba-0180cb2df90b	3911206c-0dea-4f85-84fd-93f7f131461c	secret	xJhCNuNGMs0hoRn7xocrI-b4W-_X-m5rCKCVF29hT9yaqW_BbgfEgfMpV0V3tyHzSaXAbHfEe6BfXLUCnzf88w
3f407f97-717f-4a72-b182-e275862d0c1f	3911206c-0dea-4f85-84fd-93f7f131461c	priority	100
d75b3d9e-cd88-4c1d-9a86-f82903a45f7f	22d6b82f-ab6f-457c-8339-65179a98e754	priority	100
53b7ef6c-1857-4a2a-8bd5-eecc9ce8858f	22d6b82f-ab6f-457c-8339-65179a98e754	keyUse	ENC
d9f2a168-49bc-4ddc-a69b-697a33d4dbd1	22d6b82f-ab6f-457c-8339-65179a98e754	privateKey	MIIEowIBAAKCAQEAmKcSXd4xN1kD8Cv+JZ1STGcFDuzZhR7dWm5jS3IpbwqNw+xEgObmF+uIRJuIzGMxkxWRSNBwuNUtJUtnr7NF7oPSh9hJc36lRHxlFmEaBEjKf2pUayopVMXEaqO89/neok+6sLDvDBSGmbFZNooT1v+mcFbFmTgQcq7rfjajuDMmW75rtnia1IHpVLhALQQtg6taG+h4yNER1RF7k4OhrQaCmZWV8Nbn1y2B0H8lE1zw1oE2jDVEWLgdxzPhxfGhzN2j07LPDUigkkKX81xBe7MtiKaY1iA0xkppvDnRqD/qt9KBSTlAbtFm+50l0nsqGG4EYCOaaeRAIoSd7u5qXwIDAQABAoIBAA89U/69ro7RUCyrTQABqLRVRJKs3+UDo82MtP+p3Ku9PfyP8HbTQP1PrOxMgBJc2hd4+7wX3b5WFIpjRhgAVGbvZMEzEoIj4+k7vKEd/d7s9WpVpH/eVv9OOcGmVGMyisthckiEIW6Z+KYMp9S4ttUBSLhxBou5USBh3hiyPmimaw5BhctsiUdRLe7x0QqYagPplh5mWNqsolN7JRWkXTBKJnrecYOMhUW7OyTKlAsHRTVFtckWrmmFU5CuVPWLo/eMzpeBJzKPPNzKtT45SIujtmclgqSnIodMEAEK30c+PudUREFPqx0h1UCE4wtwAZKh9+nRcFwYFcIPpSxD3UECgYEA0jkFeoQIj/fk4eXbonumzQkgiVlWAvKnieWLpbSnarVesHcCHrXF1qKX04ycDw9Ywhff0igiuRiHqP2kwEPBduNCd0fEQfSeMJqyPoWk5cQQEMOKtC9cF3pWrnBwnR5h7VRvkJFBGopwj+nEadPYz8TIn6QYMEtloZ+KdlrLFLkCgYEAueTGCPMdsKo5mHY6Qyk/WuI4aUEr3tDIWcKmoOMHgnwJouGJHvwfLFmoeuBiCTknE0gkRbWmDJK7qAtgRRfyIUrs/2g0gp8Q0XjpOF5HgECtujZtKCCeYAgiMMrqvPxSTEKn7QFFjV3l8BJWOJ3yjSRLF1/Of6hdDaemc310m9cCgYEArSAwltkthAMPB8qYupNCpxChLvvXjc3wk+vquaixR3veY01e/ZONPlng12OxEeX9nrqypQxQrEa7Ujyw9XXXWeWG01zTD844iKadrEe7qU1yPZwMGp/2I4+o2zfWRk7DLwSebFxzVTw1vw8xpkXFBDZ3UqF9Gii9pgERsq7LGGECgYAeCceuXoqnp3oTFtenTpz8NJ3k9DEAmkAlsPx39veZsC1mcodTyG3JHtvIr0VoNCIKTZf+47FnSrakGuJ9h7cKhi7xvobtrIJtNtqIz0NCiDEKbA0LdOninq3XsJJp42PxCrxT4ea5RzkGqA/iqjMtd3Xi2wplOnF+6V5OPzF+lQKBgHhvPIQ7epvOJmvYkLDqr2KDaWW+jJ3Ec99mNa107LqHsRK91X4kBMP06ALY0CJzXJAXL2g1TixrbqbZcIl+p1hO2BUljI9L5nd7QpVjpak48wnpyn6+R9y/zZrv4PFENyghuOsRbfI1rKJtJKPepQqCwCjDqJwXljRZvUZ3Z2W9
1837c994-978e-4dbf-9888-7285d4873abb	22d6b82f-ab6f-457c-8339-65179a98e754	algorithm	RSA-OAEP
a997921c-7c87-4b6f-bad2-50d89cd610b1	22d6b82f-ab6f-457c-8339-65179a98e754	certificate	MIICmzCCAYMCBgGKY8DwUzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwOTA1MDUxMDAzWhcNMzMwOTA1MDUxMTQzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCYpxJd3jE3WQPwK/4lnVJMZwUO7NmFHt1abmNLcilvCo3D7ESA5uYX64hEm4jMYzGTFZFI0HC41S0lS2evs0Xug9KH2ElzfqVEfGUWYRoESMp/alRrKilUxcRqo7z3+d6iT7qwsO8MFIaZsVk2ihPW/6ZwVsWZOBByrut+NqO4MyZbvmu2eJrUgelUuEAtBC2Dq1ob6HjI0RHVEXuTg6GtBoKZlZXw1ufXLYHQfyUTXPDWgTaMNURYuB3HM+HF8aHM3aPTss8NSKCSQpfzXEF7sy2IppjWIDTGSmm8OdGoP+q30oFJOUBu0Wb7nSXSeyoYbgRgI5pp5EAihJ3u7mpfAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAGKDda8i/te2wGGk6myOl7meUitKtP0pzvfcXg2sdgW6kaiY8DGhhnJDHy/3f+QdL/GLMTha8KIAXshLUCL3qeRs5sWQhG8u2tqGzvL62LX3nQ+j+FNlPWFqOjns/2gzIkQT8xoZsTk4iaEhKRV5sUMAA6UasKyPdQ1ORqaK9x+4YPZj56dZ3iGSF42mvDsEb0K2hQPgfK9pblSj4hr62n75cH5T4DSGlSxprvrY+aAFighmB9Wh/QCm6ol+dBiGMwHRSz93KPqg/+RJbrZHL0JMXsyjaKW/QGpBxJKZQer2zqTGHo3gtyObn1l8jflFHFj3EzjtWOSHwHNZ0ODdXcs=
6b445eeb-45c0-4be3-b629-4bb6c14c0dcd	29e4f6af-cfac-409d-851a-d22ec7874690	privateKey	MIIEpAIBAAKCAQEAyHVH7RwW6e1GsH+tY0gGJ8foSLyWkR8xtbMfzuqQdoLc9th8HSAuAvCuBLhLqmaeoarfrg8qtgIl4oRbbS3sGqEMbulQHwtHIFDW/1QZYqVxseW0sX3Gs5DxUC+0pzJdO+HuEUijSmgKwXGeHh120qI5QME0epedDZ11QmOHMv+EIeJeZI0aRGV2yYgf91uln6q9YEyc3K/doTOh+Nn1GiTYYaT1sO2zh1lKW85fQTZxDILVPlg0NYMih1IufSGpHja1K8xSdGgsXXquB8mmWS+gj1RVmnVl7vUlk3jURDRrdVu53w6kgQtuvGuv/tORUVs7nlXmRL7M7YerV6XtJQIDAQABAoIBABCvi9D6+sChDWEerOuWhgX6ArtJ5gyRY1K5D3I/8yNyPtCrR3V92rvy6xad0pU4soae0byhgDrN5fe7cF10/5yzKspGpcfXvqVmz+aen6L8RiulL7ZrKPGEee8PRth4qEBroiSSfnPF7PNE26utDy7MQxDBTvbPYkrNAFg02amka5V1ym/yncWiL1Q4XqQioLnqZA6Pf4w+tEllCgSLQpqVy+cwLl+DYWErI8kwV7S5aJgWHHM9uUGngUDNP8RVTVgt1MP8tE1i3oo3OgUqLO4cqcpnpBS+5VOzTUobozGvavHiKKOwuIgVFNjhMf47ghqMA5mu/41N0n1XbSOzbmcCgYEA/i7R0WG80TBKVocCwMd3X77IwIUvsRpU2F2oGLW5K6GljTfwpY3k+/rejsBpEDUitXTx4FQL55CROUrAg8IHgtIAzJRV1wW9NyvXBkwb80chGwXDKC+Tp5PIhE09z45XwOyFzudOP0SxWLxzQe7jny1Y2ahL4UMCbmnmlFQxWncCgYEAyeQjvcoNPA9YRGIaHdjx6XunUjpfy8oyQxo7rzsbIg/2RbJOyg3xlCWox3bhNiASI0+bsZSbcY0T4CpEWY6meLpDnTfbNRM+eLijetoCHlWc7d7oquCCBdCtDIRP1xrOgOEuNjdQcjZ3BzYplcxKYD8s0nYv4R+8jQsdQyKuwEMCgYBL1eoxvyhXfUHgmP1gSOK7xS8eCV6WR1XjC+ZYIPezJdI/1N3OdwxHhaybCJsQA9psKwzzMgAvQXmij0Pqy5v0EvW8E9GcipDOghzwOwrnxWQCLPDx72ftSnE7z9PONhjGbYrqlSZKSBNldywoEr8EwcHNhqHE/noeOShbPtdOtwKBgQCSJGL671fFMhZi6eCd2nzC1o+4JilSC3t2t3ac0dxCO+u5Z+lAufc1lk0mlhdQZsa6aNX7Jeefus+4ZOA1M92tZqerFtPHB7chDAbK1yTRcIe4aLNjfkCglP2vIdfpja4N/PLGrCO/iU2AGuTfWpI8OX7omkTuYVrLflAgWOrGoQKBgQDp0ZV8j9i3ZfuMrtiOYZIo/1t9eABfSGQvgWhwHqch+foNGz+1yt7/RaGErdFn3dZdSOiYgIWssK6ir3MwfapsfmKetL2gx+bye4FgRBxYpj1s9V5Bw4lqjCqV33oxyauQ9t9OrS/lK1O/mqjx8oUGSTIiBN9Z9DuQAOV8JkQ4Hg==
741bad74-3e47-4a96-a989-1cecefc4aa6d	29e4f6af-cfac-409d-851a-d22ec7874690	keyUse	SIG
58e195db-8bae-4611-87be-2644609f7a3a	29e4f6af-cfac-409d-851a-d22ec7874690	certificate	MIICmzCCAYMCBgGKY8Du5jANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwOTA1MDUxMDAzWhcNMzMwOTA1MDUxMTQzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDIdUftHBbp7Uawf61jSAYnx+hIvJaRHzG1sx/O6pB2gtz22HwdIC4C8K4EuEuqZp6hqt+uDyq2AiXihFttLewaoQxu6VAfC0cgUNb/VBlipXGx5bSxfcazkPFQL7SnMl074e4RSKNKaArBcZ4eHXbSojlAwTR6l50NnXVCY4cy/4Qh4l5kjRpEZXbJiB/3W6Wfqr1gTJzcr92hM6H42fUaJNhhpPWw7bOHWUpbzl9BNnEMgtU+WDQ1gyKHUi59IakeNrUrzFJ0aCxdeq4HyaZZL6CPVFWadWXu9SWTeNRENGt1W7nfDqSBC268a6/+05FRWzueVeZEvszth6tXpe0lAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAEXtuV7hEUuFV1Y7a0hiCdKmxAboa/r5XSqBUanL2AkkLhsWfG/a8CpeBQvhC3LE92OfRlb9QbsAhaEksRPxAoNwEEtkdEeWr/w+Fz7YeROtPAL1CVyd5CDUzQG9XyjS0Rmw7vLdj6mOWNptBE4acxagBIVA/IMTpAqNd3F+2+LVL5EFogIXrtI8nQk+LGzwZ8MtEz8MmK1ZHPJwuU9rAlOzmDbyxb06ae4qM3cR5FvHOlEYTnBp/k52e4Efq3rS5jkAYBBQE5SPc68CgO4ZC8Rc1xKJsbtPrR3nfM/GQPsKf1F4yyAV0uwmwGK8Z3Ei1TWO0v8dLxfOn0eoXhbBZ4s=
243e98f6-df8f-41cd-8413-f46d952cebe3	29e4f6af-cfac-409d-851a-d22ec7874690	priority	100
6db91291-9d7d-4885-aeb4-a1d8159e51b2	74714c68-583f-4483-9b76-4782ff308378	kid	3e4db2b7-aa3f-46f3-ab58-3275fbc4ea3a
e86e4c25-cd33-4711-8778-ee960307c46f	74714c68-583f-4483-9b76-4782ff308378	secret	gq6ADvKXocM_aIXD3dF8pA
600ea443-2e2b-4c3d-bfa4-474d2f7d4496	74714c68-583f-4483-9b76-4782ff308378	priority	100
a8fdbb17-d81c-46c7-8591-0ba67916ecfc	39397f40-c828-4059-95a5-bc9a6de49528	priority	100
5da97af3-5889-4c8e-863c-875d65f6d7a4	39397f40-c828-4059-95a5-bc9a6de49528	kid	8c2c714a-53fc-40ab-976f-5b6babd1b269
20361c2b-2a9a-4271-a8de-81566d51ef54	39397f40-c828-4059-95a5-bc9a6de49528	secret	KGdVJhnuVZ0YB6Q7BWhNeg
23579fc9-986b-4457-a2b1-d8091c42d49c	1194761a-e76e-4090-b291-9208c2c5ce75	priority	100
fe9962eb-45d3-45ee-8486-e0f1a05bb889	1194761a-e76e-4090-b291-9208c2c5ce75	privateKey	MIIEpAIBAAKCAQEAveL5QYz/erBylGu0BPMWzjD97LZAJDOsy49aavBL2cwfwjYlPjJ/OxRifoJfWDXyx7ARXaJhJkBNNBHQkyEpNdppp7VqHxxvNWti4KekeOYkX9T2bH/W60hQYvRTOT0geUbK/DEt3JyvYAJHNxSD+g0JdQlePQ4dKbZ4VGusBFPAlfMqxfPgSGUJSoUIufT2ldwXLQC8ULr8rIRSrwXAsrgg2vu/hbKsmYaeoQZu/6C6DwTH0iY1Eeecn+xWRBhj670SS0a2z5fQHogv+OZV5JXbIHQZdOr2kw3JNXze8rL11el1KtSkbsY7IQC0hYlUMIX3RCY+7gGiKl/gEUOERQIDAQABAoIBABqT61lud8/fZJo7nP3YXIfNuazpMX8fsH7peLlhGuzIMmXHmFzlSoOlbcfRTbEWE/45OaUGdlyZQXUZTT1atd7wzDsKHGlwXGx4tGVHcbDuXYcAUuGK3zUdcQr4sbFgSexPqVe1NnsbfzyL9RXTjElyi7FS91rKX/CXtq3ySChupkhsFcOtUcgihJxTLzZ/KuYVrgNdUvr/BKZ7fR1t5ULG3TVK4pOXcJ5irIEUlY4Zn2gNZKgNL9SUfGAP/XnEYzDtNVc6gDxE+UgprlONsXEQC1I2TYx7YnGAzebRituRQ1rsGa4fY3TWmIrTbbV33b18boXoM/X6vvwACqFl1EECgYEA/NIkfWSsQY/tytJW8LHqdcI02a44IghVdyYdd5wtu3d3BF2YubocAjP/bcMuYMLJ7ML1bNejkMwtcioSXEg279m4EpxWSRQEw5nxUk9NlBloer7ZXXRwHbKSb9c6Yw27C78qnjGtK7VYsz//lxRw6M2FKJ7ZvFfvxS4W9AYXA/UCgYEAwEY9MA1GPV1kxqoyZ5P9Lhm2z2WhDCNySQ/01b7XKfevhAYpSN9uP7y0WV4wur7pywuujPouBygp8EjozvwGJ1CM2O9Ty8n/O5hLHCRV47yRXDAbLHL8+/XaOZduR9fK34GtGfI7KJD1tg4MdWkgJOjC6DMw1D1qDbEn46iznRECgYASY7qxwEPjVPPH//rA8UALpr+vYcPFffOxgf08uQh+jVcD40b7o3TsGBopQrw535FOfnPZoenM230mw7aoLbyJP73q5KJGGIWsMKNkCE6tShfWbdFjwddx4Y5TQkWF9Pa5CQOxlA1zk3JLP4l41MzNsj1QUhWmZIMVRZ/3ygWcjQKBgQCiqcmSIWjO+XgMamiCID0NB0wVYZFBx6skDI/BVNaK9rRSKTQ8JmoLGgYppPnswx7fXF6rfev6ugvg8I2krqo2EHtX/AEUYyu+qzS/9i2DoUAIkdorXIySTIf2ORpfRTyoofhj/v31b82v22rG2c0L7K8X6lbg96QFOV7ZxxtNQQKBgQCMqgYlx9CkEajtTdppW8LgvQd5fIkJs/Ra5pugetRjrxEO4iZzPeyCrGoCU1Gp1KkdZhxX/OXZUpHB8hcDaBQzz4tSbDkU/v6Pcq6C7qP6SDDzgi93VVjivlcjNswRQPmqn6RSWKsWclI2a+liBJItWL2QJ4VDz5mAfsYM7pRXxQ==
8fe271dc-a1cf-4ed0-88cb-b0cb77ae506d	1194761a-e76e-4090-b291-9208c2c5ce75	certificate	MIICmzCCAYMCBgGKiAhI8jANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZlY2d2dWUwHhcNMjMwOTEyMDYxNDE4WhcNMzMwOTEyMDYxNTU4WjARMQ8wDQYDVQQDDAZlY2d2dWUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC94vlBjP96sHKUa7QE8xbOMP3stkAkM6zLj1pq8EvZzB/CNiU+Mn87FGJ+gl9YNfLHsBFdomEmQE00EdCTISk12mmntWofHG81a2Lgp6R45iRf1PZsf9brSFBi9FM5PSB5Rsr8MS3cnK9gAkc3FIP6DQl1CV49Dh0ptnhUa6wEU8CV8yrF8+BIZQlKhQi59PaV3BctALxQuvyshFKvBcCyuCDa+7+FsqyZhp6hBm7/oLoPBMfSJjUR55yf7FZEGGPrvRJLRrbPl9AeiC/45lXkldsgdBl06vaTDck1fN7ysvXV6XUq1KRuxjshALSFiVQwhfdEJj7uAaIqX+ARQ4RFAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAG/Xv3wr6vtrygaiVZg2VrEYe61QZ+nxrhIUOYBWWFca9jOQuvibUIzvjH8jqYT+PXt5vw1FVdVGTDvqgB2VneJlsgx0VWyvJdmTJQib1HczQAv/OdEK3NCdvKp+1A/tO9yypUMnYBdW7IBlTBmkifrj5bEu+4r0UXBiug3OxT4vwaj5htNGbYpoklIueuVoFtm0g96dDPZwPV9+SIGHGTYqHF9RViEXmjZfDPBmDID5muJTZSDaU7khg8uwlm8/34mkwIMdJIDwBl2WeIZiVKolArOmGgraXq1DGdhrCkZS5crEXO+nyHirA9ihgIFMHo+LTLSp1hhiv3rad+HTiY0=
22080281-2242-464d-ab2d-49276b19032e	a290fbe9-b211-471d-a6d4-de173fc740b9	max-clients	200
11a04b94-fc32-4e74-b820-9fbe232edff4	487c1b4f-1a6d-40fe-9be7-a849a717e631	allowed-protocol-mapper-types	oidc-full-name-mapper
6ceda89d-34c4-49df-8eab-c891e517575d	487c1b4f-1a6d-40fe-9be7-a849a717e631	allowed-protocol-mapper-types	saml-role-list-mapper
b611e377-4503-41dd-b97d-04d017daa12b	487c1b4f-1a6d-40fe-9be7-a849a717e631	allowed-protocol-mapper-types	oidc-address-mapper
1e1ca6e7-198f-4536-939d-3c522cc08e17	487c1b4f-1a6d-40fe-9be7-a849a717e631	allowed-protocol-mapper-types	saml-user-property-mapper
299fc783-a4d2-4650-ad5b-f775cb7f6136	487c1b4f-1a6d-40fe-9be7-a849a717e631	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
a6b5b2cb-b689-437c-b760-ff84a9c9997f	487c1b4f-1a6d-40fe-9be7-a849a717e631	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
9f4cfc11-eb57-43f2-b1f9-1bcc34773151	487c1b4f-1a6d-40fe-9be7-a849a717e631	allowed-protocol-mapper-types	saml-user-attribute-mapper
44805873-4b0a-4feb-bed1-e97290473fed	487c1b4f-1a6d-40fe-9be7-a849a717e631	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
9a859a37-0f9b-4e33-b20e-3427f8ffd1d2	819bce71-0a61-4072-9753-e60632c9feac	allow-default-scopes	true
4e48e2ac-b526-4962-bde5-867a4c3e0b7c	faa64ebd-a4cd-41b9-9c29-b6653cddfa30	allowed-protocol-mapper-types	oidc-full-name-mapper
7eb33b12-fcae-433e-bd9c-3b0d13f076e7	faa64ebd-a4cd-41b9-9c29-b6653cddfa30	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
94f2fe46-6fdf-40a8-b2ce-c934ce4c4dec	faa64ebd-a4cd-41b9-9c29-b6653cddfa30	allowed-protocol-mapper-types	saml-role-list-mapper
83987024-14bd-4147-a7a3-e0e19f883d47	faa64ebd-a4cd-41b9-9c29-b6653cddfa30	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
782674d5-3b82-4ffd-aaa9-8bf64544b9aa	faa64ebd-a4cd-41b9-9c29-b6653cddfa30	allowed-protocol-mapper-types	saml-user-attribute-mapper
e8996387-d63f-4067-8997-cfecc8573690	faa64ebd-a4cd-41b9-9c29-b6653cddfa30	allowed-protocol-mapper-types	saml-user-property-mapper
5ac6a25d-3024-45ba-9840-0b87b26ebe55	faa64ebd-a4cd-41b9-9c29-b6653cddfa30	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
de14f41e-3cef-4b15-a561-cc4ee794dfc8	faa64ebd-a4cd-41b9-9c29-b6653cddfa30	allowed-protocol-mapper-types	oidc-address-mapper
14be7719-402e-4b4f-81c4-67c52072665c	2e7b1c1f-7823-4343-9030-937eaac1dfd1	allow-default-scopes	true
ab084a5a-ce7a-428f-8cb8-f1d1555258d7	c489b84a-9833-4c39-a20f-765dc8aaecf7	secret	LFaxbB7TxQXs_2BMMJU9XElZAREzd2fco6UH_CYS5E0CXzHERx7rk7-x2fp4uxsKN3zsxNWLf5P8i5VjcFZ8sg
7c779a60-1d8b-4e22-99dd-5661e418021d	c489b84a-9833-4c39-a20f-765dc8aaecf7	priority	100
a70b5a6f-0165-4701-8162-5331fd4f37eb	c489b84a-9833-4c39-a20f-765dc8aaecf7	algorithm	HS256
5210ff1f-3bea-4217-85ec-3933c8e613bf	c489b84a-9833-4c39-a20f-765dc8aaecf7	kid	eb40bac9-38d4-4d8a-b703-ea953800d0d5
9e27064b-8f89-47ad-9241-fc5068657993	9d1f5d48-3b6f-4ffd-9651-9f327d8d0c12	client-uris-must-match	true
e8cd02a9-ed67-4842-884f-f54a52c9bee3	9d1f5d48-3b6f-4ffd-9651-9f327d8d0c12	host-sending-registration-request-must-match	true
3762a638-aee9-45c1-a0a6-9668415483eb	da220a1c-3078-4d86-bf16-71923c3858e5	algorithm	RSA-OAEP
3f4dd756-f0fe-43ef-b0e5-ffdf496540a9	da220a1c-3078-4d86-bf16-71923c3858e5	privateKey	MIIEogIBAAKCAQEAnjYZpN+3JOlboang97WQMLrxmPKSmB1/JXGnk3eCvoKQJqYgFxba5TaXilvy2Gzd08wUAR0NxZMOEFoeU2WGjGZqdOs5Fg/lzUmHItXi7d2YD4kng1rl6XwazIUueZWqaHN5I8oXwRpHluSuqSSgTg3ASG/BJRbfZpa/tRpOBT9pckXw++3kYGSznr/BI3c16YNnhHUYJSnnu2yv8JKU1TD90T1CMmaoxo8pWnFYiHbG0Kib3IsHfmTEJKAyBbroIfzELkrC9xZIxhUdNa94kLel7KP4a2p5W3ZxQysjUd/JBJ+ghByGnMGfoMbwQ6UMjX0f/MCBOrK4rYFnm9y4nwIDAQABAoIBAAgVE3JMy3pjQX8cwpVk/RzAMB90JPEIcLpk9/6cmF1LJjoTOohzbnNPOqai0+EijqKHRm5YIZ/6RzmmoO35vcnmYYHfkmcCIOc/3lt1OcaVD3Obuh0Hw78NzACuvRURBEeZvpKJfHUs9oNK43FYoafbI/uPWfqfFIKVKO4DjgDOi+kyjbCQ1u+Q3S7mJ6I+LqCdYSh05XRvdSWZ8okm1k62Q8wkLMJQEbWvL8bD60bii5Xq5u3z9nbpgl7ArNRWykWQ7BCRGy9Ke+hIAHmHju6cDTYjpcZKDMVT/m3ZCzssxzz2t+GdwquxP/pVSYMwUS69aQVoSq8iQ94tf5+49MECgYEA1CVLzd0eSwnrX3MH9J8vWgyzjNUW1YPdDbCc+Y56PZ8PR3uH4AqibZh73sEQJgAT2JTKNZL50X99pcaD+EfObu7/ifqL7Jo4TQ2jbZxoqWYnz5b8eS/btkXFiJ8AQf1mZH+3YNAP59m66c0TjPMTvZNTUJHK4WDgBGBnaTm7LukCgYEAvuqcBOh7OKgm/ylSXhKrgDLBpj5Z1QhNpfdOU1r0mNoGmu4Gq/tatbGGLk+xLNAfdCmiFN1hKO4VNF59NpsV3rcuChG0w16THDxGMmMjS3uw4hhq8cem/xRovud+6FkPsDzhwuOjFBlIfn/MySC25nJ4vSguz+n19DDbxHvHRkcCgYBrmV8RUw2CUc2n49gtInAJ5FdNHuct9Gux/dogWTt29a3yO5127O3lWGm7WYCvRWrLduv4sEs1DszTwBQ/YWw6p83EVeeSYcYcjsZNWf9brAyVJad4b+WoVUsTOFIRJk1Au+ZunBj1J2G+I92+p6tjg83GF6wnE9OLZLoOjNF7wQKBgDLLvzk7FdXsP3vyZZzsAL96QbXWrxYUQHyhATECaUPl9o3wOMw3c1oWYqodv/k5YrUIgrxkbn5yYift4AjQWJBKUrCRJ3Q3zJJdoxuy7ugdf+GYN5Qe19rUdk4cz9JIJ/lvKW4uHOyzEWu+2yDEWIWV/XPupg3hpPQUr9RmTo3vAoGAYvoszW2M6IwWZCZ3A8cvqYTH69nQhtzIq8BaA96ei9L1BCri8K4BqJl3SS9TrjRQ0s3EnYbn6FyC7hLe/LlB00Q4jfauCJoWozdrxaKLS9j/nnMlTXXUEnlNXRAEMrpX6q8dMC+aewKxjIg2u6oUsxoWJavgY1mqBOejHDhzFdA=
4e42ef61-81e3-410a-8bc9-90911f3259a2	da220a1c-3078-4d86-bf16-71923c3858e5	certificate	MIICmzCCAYMCBgGKiAhJzjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZlY2d2dWUwHhcNMjMwOTEyMDYxNDE5WhcNMzMwOTEyMDYxNTU5WjARMQ8wDQYDVQQDDAZlY2d2dWUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCeNhmk37ck6VuhqeD3tZAwuvGY8pKYHX8lcaeTd4K+gpAmpiAXFtrlNpeKW/LYbN3TzBQBHQ3Fkw4QWh5TZYaMZmp06zkWD+XNSYci1eLt3ZgPiSeDWuXpfBrMhS55lapoc3kjyhfBGkeW5K6pJKBODcBIb8ElFt9mlr+1Gk4FP2lyRfD77eRgZLOev8EjdzXpg2eEdRglKee7bK/wkpTVMP3RPUIyZqjGjylacViIdsbQqJvciwd+ZMQkoDIFuugh/MQuSsL3FkjGFR01r3iQt6Xso/hranlbdnFDKyNR38kEn6CEHIacwZ+gxvBDpQyNfR/8wIE6sritgWeb3LifAgMBAAEwDQYJKoZIhvcNAQELBQADggEBADvPuVWSxdcB+slsS7fjjQ5oRDtqyVyfGEPpbTdii/9GoO7gWTxYEL0K4SWwBAHMbJ9JpTN69aiU+8Wh1kMZr38b2fOpj+YiscnK+uqFsCXNQ5zCa+jO3R9uhKnaqEX7rncXTWn2jvui5+uetMbZf8yoWEELIhWqcyMz1kKGw5BkSz4maGv2tfP8JYyv877JyjPMKKofKava8SQPrzNAq4o2KXgg2V6icQ0TrXLkR/eJT3dzTGuenjeK+PY/1yPPosuFQIcLqpRSvubFk25j9Fz13505cWRjznAQlTtjS+fGD1SO5bGn/wDtOv8Dcv+LXgCVDm5El8Y5BzOLvxkFap8=
d4f296da-d5e9-4dc0-be7c-45e8bcba996f	da220a1c-3078-4d86-bf16-71923c3858e5	priority	100
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.composite_role (composite, child_role) FROM stdin;
03ee2cde-c226-451c-a40c-cdf830105b93	f28e87b1-4c02-4753-a828-3e96aac24f8f
03ee2cde-c226-451c-a40c-cdf830105b93	ec9bc5a0-1889-45af-9e4a-258650fbba2a
03ee2cde-c226-451c-a40c-cdf830105b93	d9782775-0d8f-4b70-a000-81fdfe453949
03ee2cde-c226-451c-a40c-cdf830105b93	dcff303f-36c9-4520-b8e4-8ebc93539319
03ee2cde-c226-451c-a40c-cdf830105b93	1ac91e22-8961-4b81-a868-ff5d04c916aa
03ee2cde-c226-451c-a40c-cdf830105b93	18e41cf7-fb08-4bef-8fd9-d9ba519505aa
03ee2cde-c226-451c-a40c-cdf830105b93	7c419195-d486-4573-a44a-5748e10bcb65
03ee2cde-c226-451c-a40c-cdf830105b93	11ae7426-fc1a-4952-b338-d9451fb73839
03ee2cde-c226-451c-a40c-cdf830105b93	c35352e3-dcb2-4f48-b398-18fb1ac01e7b
03ee2cde-c226-451c-a40c-cdf830105b93	979d9ec0-22b6-4bf1-ac5a-6d172e9aaefc
03ee2cde-c226-451c-a40c-cdf830105b93	b32b77cf-5965-4297-8015-c19401ee3795
03ee2cde-c226-451c-a40c-cdf830105b93	b16068b0-1c00-4e37-a5e4-c82c5a776f70
03ee2cde-c226-451c-a40c-cdf830105b93	ccd82bd3-3238-4382-8df4-5234f92fc063
03ee2cde-c226-451c-a40c-cdf830105b93	b09e2c8c-5e04-4c5b-8524-68f2c2988bea
03ee2cde-c226-451c-a40c-cdf830105b93	f725a2fe-13bd-4249-8bb6-5a727840d41b
03ee2cde-c226-451c-a40c-cdf830105b93	a083216f-77c4-43b2-a849-4ecd5ea44d7f
03ee2cde-c226-451c-a40c-cdf830105b93	5b09ca0d-d1a5-4b5c-baca-380b67a0c67e
03ee2cde-c226-451c-a40c-cdf830105b93	f3f1baff-2e87-442b-895a-c34c5aeecd2b
1ac91e22-8961-4b81-a868-ff5d04c916aa	a083216f-77c4-43b2-a849-4ecd5ea44d7f
67c1eaf7-a431-4fdb-bfe3-22488d63480d	612c5ee2-10db-4071-a064-99689a9a4ad1
dcff303f-36c9-4520-b8e4-8ebc93539319	f725a2fe-13bd-4249-8bb6-5a727840d41b
dcff303f-36c9-4520-b8e4-8ebc93539319	f3f1baff-2e87-442b-895a-c34c5aeecd2b
67c1eaf7-a431-4fdb-bfe3-22488d63480d	6797f4b8-ad7a-4855-af05-adc87afce98a
6797f4b8-ad7a-4855-af05-adc87afce98a	f54b47e3-d4fb-4014-a5ef-d8c4287a99bc
f47da433-5f7c-4cbd-8f7f-aea3fd56b67e	63df92ca-6e9f-4008-a4fb-949ecd821af8
03ee2cde-c226-451c-a40c-cdf830105b93	7aec9553-6301-421c-8a0c-753f48f99cb1
67c1eaf7-a431-4fdb-bfe3-22488d63480d	a899d539-c897-45c8-9174-7377a1661c44
67c1eaf7-a431-4fdb-bfe3-22488d63480d	af901d14-7be9-434f-a8f5-9cf941c4b71b
03ee2cde-c226-451c-a40c-cdf830105b93	9077ec64-9ce5-4d03-9743-c4c31b0843cb
03ee2cde-c226-451c-a40c-cdf830105b93	3da3ecea-247f-41d5-a442-5684d1950312
03ee2cde-c226-451c-a40c-cdf830105b93	419abc55-e580-47c3-8b25-24c7884983f8
03ee2cde-c226-451c-a40c-cdf830105b93	51fc769b-3b11-497c-bc8b-a63a991801c4
03ee2cde-c226-451c-a40c-cdf830105b93	a25c0620-2777-4430-b925-6cf19973a613
03ee2cde-c226-451c-a40c-cdf830105b93	6d0a2bcf-860f-4f0e-b48f-da96dd3c027b
03ee2cde-c226-451c-a40c-cdf830105b93	bcc8e1d7-8907-42d8-b693-797ba40b8734
03ee2cde-c226-451c-a40c-cdf830105b93	8df2d8b1-2863-46d8-a515-bdf827f0f340
03ee2cde-c226-451c-a40c-cdf830105b93	798052c9-2596-4f14-b58b-bc9e8e8ba7da
03ee2cde-c226-451c-a40c-cdf830105b93	b226c131-06b8-4a12-9676-e46934f43176
03ee2cde-c226-451c-a40c-cdf830105b93	633802fb-228f-4f78-846d-e5dcd637affd
03ee2cde-c226-451c-a40c-cdf830105b93	f436fa8a-1d29-4335-80e0-3d78aef3d46f
03ee2cde-c226-451c-a40c-cdf830105b93	976ba71c-ea02-40df-8c5b-d4b38455cad5
03ee2cde-c226-451c-a40c-cdf830105b93	8bba2ad9-edae-4102-947a-55d1f9faee4e
03ee2cde-c226-451c-a40c-cdf830105b93	2da5dd9b-7421-49d1-b9c7-01c266d54050
03ee2cde-c226-451c-a40c-cdf830105b93	398decc9-1cd5-44f8-ac94-a6fb5358de9f
03ee2cde-c226-451c-a40c-cdf830105b93	61935426-1b8d-42fa-b409-a25838bb230f
419abc55-e580-47c3-8b25-24c7884983f8	61935426-1b8d-42fa-b409-a25838bb230f
419abc55-e580-47c3-8b25-24c7884983f8	8bba2ad9-edae-4102-947a-55d1f9faee4e
51fc769b-3b11-497c-bc8b-a63a991801c4	2da5dd9b-7421-49d1-b9c7-01c266d54050
03ee2cde-c226-451c-a40c-cdf830105b93	c8871de4-0cb4-42af-8b83-55e83ec7d417
235b7ba1-c0f3-414a-b2b6-6ba04f7e5f43	ea7d2f1c-cf6d-428f-91d4-4e63910186fa
235b7ba1-c0f3-414a-b2b6-6ba04f7e5f43	2c4f22e3-d3dc-47e2-b8f0-fcde5236d0a8
65aa1435-eb72-4925-94ee-737c65c93089	41864266-7c38-4cb7-8a53-acdd63a3105d
65aa1435-eb72-4925-94ee-737c65c93089	e789998b-0b9a-4f3f-9cba-5ce693d54b6b
65aa1435-eb72-4925-94ee-737c65c93089	56bfe62c-bdb0-42f6-8351-4e38f6370a6e
65aa1435-eb72-4925-94ee-737c65c93089	745167cf-3a7e-4302-9027-f7ec388b2fa2
7b0e47f1-3687-4641-bfdc-c47728abf91e	971c8a63-50f4-42fd-96fe-bff483996025
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	235b7ba1-c0f3-414a-b2b6-6ba04f7e5f43
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	1a3a4805-03f4-4a19-826c-e419e7d0e49b
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	ea7f6cab-0b72-46cb-b805-580f886c7baa
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	7b0e47f1-3687-4641-bfdc-c47728abf91e
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	971c8a63-50f4-42fd-96fe-bff483996025
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	5006cccc-ecf9-433c-80de-be06e6cbb81e
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	2c4f22e3-d3dc-47e2-b8f0-fcde5236d0a8
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	75dedb29-1dbd-4cdc-bba1-0bc0eb805b6a
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	be87eb49-aa0c-490e-b78d-fd684d51f0c5
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	449612b0-012c-4869-a65c-8f78ea22895f
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	91b2d6d7-6b0c-4142-9c26-b2b45e0690ca
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	43a70a76-90b5-4320-a274-126ffc80a1b6
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	ea7d2f1c-cf6d-428f-91d4-4e63910186fa
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	c90bf2ad-3447-4444-b3ba-21d3563688f6
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	221c9293-f38b-458d-8400-db169a5b9d22
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	6a1f4950-14c8-465e-ae14-361160c61345
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	bbe55091-5055-47c2-835a-2123fc5ccd7d
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	8cee6636-9527-4d12-895d-bf21e11ec843
e789998b-0b9a-4f3f-9cba-5ce693d54b6b	0af23ec5-9c11-489f-bdb7-d2fdeef78d1d
eaa471ce-d6c2-4f77-8f95-55438bb50722	ca95fa5d-e131-4d23-adab-ca29ab55ad47
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
c267bd66-6516-46f5-854f-76d978b54874	\N	password	4bb33f6d-fee0-4075-bc8a-7c3a7c3dbd5c	1693890703823	\N	{"value":"CWoKK5vqxG/8pldvM84+NNgaGrfaoqPgCadtbhf/eT4=","salt":"43h59Hd7xuD1eflyLRZU7A==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
0c0f4d02-2b2e-482d-bf03-93fe615bdf96	\N	password	2fd6ef3d-9172-4976-a8fd-2e41604f8d31	1695017315753	\N	{"value":"Hw7XdXCkETdl94TUjcAmH6gKm6S22oa+Q+lC6/3VXnY=","salt":"DtGgEF8LbKyBkrG3j6qLVA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
9dde764b-8f73-4627-852e-3d2267b8fe0d	\N	password	cacce085-332a-449b-a695-523c7afbca74	1695017332226	\N	{"value":"/R5sWHMxQLMURFchySfMMKgNjoEVocEzr9B4jFWSOFQ=","salt":"gB354no3DK2Y694rMA1YLQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
f5dbd0be-a2f6-471b-80d4-e1b95a48ee3d	\N	password	f393fe46-2543-45d4-8aa2-2a2358e48d6b	1695017364395	\N	{"value":"EkcR3tLy7fEExE8HQwy2HwZjGmbRh5xZGxJw4weo8Uw=","salt":"Q0f+pXgqWiOgNEuRSJZLTQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
ca6a666e-8a0f-42c0-afef-949421116964	\N	password	2f8393d9-a007-4504-a29f-4e95cc46b9c8	1695217971959	\N	{"value":"SRVFAYKTmpuJAGPuM+wuNNxNFnbm6e7gBhThlyVxzZY=","salt":"OX24Wawl9Jlc+7ZPJsRRbQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
719acb40-32c9-48a5-ba3a-6fcc75d5f59a	\N	password	19232b93-e939-4ed4-a3bc-26a1ab06e90a	1695223101963	\N	{"value":"4xefsUfdXAK6XaszO8+dOAy1qpEi0o4U0EZp87Wp+98=","salt":"5DEXRtvqLAT85GRYPmZNjw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
b18fc401-003f-4602-aa67-208bd9a78810	\N	password	3573dd18-16ab-4aaa-bf68-63182751aba2	1695224159539	\N	{"value":"QeDTY655c/6oR6WwArqeFHrkEX6XTcCM4cswBeoD6t4=","salt":"0hu+UoBJyfI1sv2jN8ZEUg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2023-09-05 05:11:41.095893	1	EXECUTED	8:bda77d94bf90182a1e30c24f1c155ec7	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.16.1	\N	\N	3890700788
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2023-09-05 05:11:41.101745	2	MARK_RAN	8:1ecb330f30986693d1cba9ab579fa219	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.16.1	\N	\N	3890700788
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2023-09-05 05:11:41.129579	3	EXECUTED	8:cb7ace19bc6d959f305605d255d4c843	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.16.1	\N	\N	3890700788
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2023-09-05 05:11:41.132291	4	EXECUTED	8:80230013e961310e6872e871be424a63	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.16.1	\N	\N	3890700788
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2023-09-05 05:11:41.189091	5	EXECUTED	8:67f4c20929126adc0c8e9bf48279d244	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.16.1	\N	\N	3890700788
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2023-09-05 05:11:41.190804	6	MARK_RAN	8:7311018b0b8179ce14628ab412bb6783	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.16.1	\N	\N	3890700788
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2023-09-05 05:11:41.245521	7	EXECUTED	8:037ba1216c3640f8785ee6b8e7c8e3c1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.16.1	\N	\N	3890700788
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2023-09-05 05:11:41.246936	8	MARK_RAN	8:7fe6ffe4af4df289b3157de32c624263	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.16.1	\N	\N	3890700788
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2023-09-05 05:11:41.250635	9	EXECUTED	8:9c136bc3187083a98745c7d03bc8a303	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.16.1	\N	\N	3890700788
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2023-09-05 05:11:41.303628	10	EXECUTED	8:b5f09474dca81fb56a97cf5b6553d331	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.16.1	\N	\N	3890700788
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2023-09-05 05:11:41.334685	11	EXECUTED	8:ca924f31bd2a3b219fdcfe78c82dacf4	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.16.1	\N	\N	3890700788
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2023-09-05 05:11:41.335996	12	MARK_RAN	8:8acad7483e106416bcfa6f3b824a16cd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.16.1	\N	\N	3890700788
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2023-09-05 05:11:41.346319	13	EXECUTED	8:9b1266d17f4f87c78226f5055408fd5e	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.16.1	\N	\N	3890700788
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-09-05 05:11:41.359052	14	EXECUTED	8:d80ec4ab6dbfe573550ff72396c7e910	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.16.1	\N	\N	3890700788
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-09-05 05:11:41.360466	15	MARK_RAN	8:d86eb172171e7c20b9c849b584d147b2	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.16.1	\N	\N	3890700788
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-09-05 05:11:41.362416	16	MARK_RAN	8:5735f46f0fa60689deb0ecdc2a0dea22	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.16.1	\N	\N	3890700788
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-09-05 05:11:41.364875	17	EXECUTED	8:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.16.1	\N	\N	3890700788
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2023-09-05 05:11:41.395054	18	EXECUTED	8:5c1a8fd2014ac7fc43b90a700f117b23	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.16.1	\N	\N	3890700788
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2023-09-05 05:11:41.429551	19	EXECUTED	8:1f6c2c2dfc362aff4ed75b3f0ef6b331	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.16.1	\N	\N	3890700788
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2023-09-05 05:11:41.433149	20	EXECUTED	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.16.1	\N	\N	3890700788
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2023-09-05 05:11:41.434319	21	MARK_RAN	8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.16.1	\N	\N	3890700788
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2023-09-05 05:11:41.43628	22	MARK_RAN	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.16.1	\N	\N	3890700788
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2023-09-05 05:11:41.448715	23	EXECUTED	8:d9fa18ffa355320395b86270680dd4fe	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.16.1	\N	\N	3890700788
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2023-09-05 05:11:41.451948	24	EXECUTED	8:90cff506fedb06141ffc1c71c4a1214c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.16.1	\N	\N	3890700788
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2023-09-05 05:11:41.453156	25	MARK_RAN	8:11a788aed4961d6d29c427c063af828c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.16.1	\N	\N	3890700788
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2023-09-05 05:11:41.474952	26	EXECUTED	8:a4218e51e1faf380518cce2af5d39b43	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.16.1	\N	\N	3890700788
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2023-09-05 05:11:41.523913	27	EXECUTED	8:d9e9a1bfaa644da9952456050f07bbdc	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.16.1	\N	\N	3890700788
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2023-09-05 05:11:41.526399	28	EXECUTED	8:d1bf991a6163c0acbfe664b615314505	update tableName=RESOURCE_SERVER_POLICY		\N	4.16.1	\N	\N	3890700788
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2023-09-05 05:11:41.571285	29	EXECUTED	8:88a743a1e87ec5e30bf603da68058a8c	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.16.1	\N	\N	3890700788
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2023-09-05 05:11:41.581098	30	EXECUTED	8:c5517863c875d325dea463d00ec26d7a	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.16.1	\N	\N	3890700788
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2023-09-05 05:11:41.591943	31	EXECUTED	8:ada8b4833b74a498f376d7136bc7d327	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.16.1	\N	\N	3890700788
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2023-09-05 05:11:41.595457	32	EXECUTED	8:b9b73c8ea7299457f99fcbb825c263ba	customChange		\N	4.16.1	\N	\N	3890700788
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-09-05 05:11:41.599684	33	EXECUTED	8:07724333e625ccfcfc5adc63d57314f3	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.16.1	\N	\N	3890700788
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-09-05 05:11:41.600907	34	MARK_RAN	8:8b6fd445958882efe55deb26fc541a7b	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.16.1	\N	\N	3890700788
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-09-05 05:11:41.617881	35	EXECUTED	8:29b29cfebfd12600897680147277a9d7	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.16.1	\N	\N	3890700788
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2023-09-05 05:11:41.621574	36	EXECUTED	8:73ad77ca8fd0410c7f9f15a471fa52bc	addColumn tableName=REALM		\N	4.16.1	\N	\N	3890700788
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-09-05 05:11:41.625781	37	EXECUTED	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.16.1	\N	\N	3890700788
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2023-09-05 05:11:41.628589	38	EXECUTED	8:27180251182e6c31846c2ddab4bc5781	addColumn tableName=FED_USER_CONSENT		\N	4.16.1	\N	\N	3890700788
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2023-09-05 05:11:41.631782	39	EXECUTED	8:d56f201bfcfa7a1413eb3e9bc02978f9	addColumn tableName=IDENTITY_PROVIDER		\N	4.16.1	\N	\N	3890700788
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-09-05 05:11:41.633226	40	MARK_RAN	8:91f5522bf6afdc2077dfab57fbd3455c	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.16.1	\N	\N	3890700788
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-09-05 05:11:41.634715	41	MARK_RAN	8:0f01b554f256c22caeb7d8aee3a1cdc8	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.16.1	\N	\N	3890700788
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2023-09-05 05:11:41.638777	42	EXECUTED	8:ab91cf9cee415867ade0e2df9651a947	customChange		\N	4.16.1	\N	\N	3890700788
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-09-05 05:11:41.719178	43	EXECUTED	8:ceac9b1889e97d602caf373eadb0d4b7	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.16.1	\N	\N	3890700788
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2023-09-05 05:11:41.721809	44	EXECUTED	8:84b986e628fe8f7fd8fd3c275c5259f2	addColumn tableName=USER_ENTITY		\N	4.16.1	\N	\N	3890700788
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-09-05 05:11:41.724026	45	EXECUTED	8:a164ae073c56ffdbc98a615493609a52	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.16.1	\N	\N	3890700788
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-09-05 05:11:41.726268	46	EXECUTED	8:70a2b4f1f4bd4dbf487114bdb1810e64	customChange		\N	4.16.1	\N	\N	3890700788
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-09-05 05:11:41.72708	47	MARK_RAN	8:7be68b71d2f5b94b8df2e824f2860fa2	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.16.1	\N	\N	3890700788
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-09-05 05:11:41.745642	48	EXECUTED	8:bab7c631093c3861d6cf6144cd944982	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.16.1	\N	\N	3890700788
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-09-05 05:11:41.748192	49	EXECUTED	8:fa809ac11877d74d76fe40869916daad	addColumn tableName=REALM		\N	4.16.1	\N	\N	3890700788
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2023-09-05 05:11:41.772106	50	EXECUTED	8:fac23540a40208f5f5e326f6ceb4d291	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.16.1	\N	\N	3890700788
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2023-09-05 05:11:41.790158	51	EXECUTED	8:2612d1b8a97e2b5588c346e817307593	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.16.1	\N	\N	3890700788
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2023-09-05 05:11:41.791985	52	EXECUTED	8:9842f155c5db2206c88bcb5d1046e941	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.16.1	\N	\N	3890700788
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2023-09-05 05:11:41.79339	53	EXECUTED	8:2e12e06e45498406db72d5b3da5bbc76	update tableName=REALM		\N	4.16.1	\N	\N	3890700788
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2023-09-05 05:11:41.794633	54	EXECUTED	8:33560e7c7989250c40da3abdabdc75a4	update tableName=CLIENT		\N	4.16.1	\N	\N	3890700788
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-09-05 05:11:41.798286	55	EXECUTED	8:87a8d8542046817a9107c7eb9cbad1cd	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.16.1	\N	\N	3890700788
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-09-05 05:11:41.800793	56	EXECUTED	8:3ea08490a70215ed0088c273d776311e	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.16.1	\N	\N	3890700788
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-09-05 05:11:41.815438	57	EXECUTED	8:2d56697c8723d4592ab608ce14b6ed68	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.16.1	\N	\N	3890700788
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-09-05 05:11:41.86325	58	EXECUTED	8:3e423e249f6068ea2bbe48bf907f9d86	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.16.1	\N	\N	3890700788
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2023-09-05 05:11:41.883247	59	EXECUTED	8:15cabee5e5df0ff099510a0fc03e4103	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.16.1	\N	\N	3890700788
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2023-09-05 05:11:41.88744	60	EXECUTED	8:4b80200af916ac54d2ffbfc47918ab0e	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.16.1	\N	\N	3890700788
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2023-09-05 05:11:41.891703	61	EXECUTED	8:66564cd5e168045d52252c5027485bbb	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.16.1	\N	\N	3890700788
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2023-09-05 05:11:41.895397	62	EXECUTED	8:1c7064fafb030222be2bd16ccf690f6f	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.16.1	\N	\N	3890700788
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2023-09-05 05:11:41.897505	63	EXECUTED	8:2de18a0dce10cdda5c7e65c9b719b6e5	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.16.1	\N	\N	3890700788
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2023-09-05 05:11:41.899192	64	EXECUTED	8:03e413dd182dcbd5c57e41c34d0ef682	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.16.1	\N	\N	3890700788
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2023-09-05 05:11:41.900776	65	EXECUTED	8:d27b42bb2571c18fbe3fe4e4fb7582a7	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.16.1	\N	\N	3890700788
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2023-09-05 05:11:41.90839	66	EXECUTED	8:698baf84d9fd0027e9192717c2154fb8	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.16.1	\N	\N	3890700788
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2023-09-05 05:11:41.911567	67	EXECUTED	8:ced8822edf0f75ef26eb51582f9a821a	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.16.1	\N	\N	3890700788
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2023-09-05 05:11:41.914003	68	EXECUTED	8:f0abba004cf429e8afc43056df06487d	addColumn tableName=REALM		\N	4.16.1	\N	\N	3890700788
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2023-09-05 05:11:41.919419	69	EXECUTED	8:6662f8b0b611caa359fcf13bf63b4e24	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.16.1	\N	\N	3890700788
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2023-09-05 05:11:41.922004	70	EXECUTED	8:9e6b8009560f684250bdbdf97670d39e	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.16.1	\N	\N	3890700788
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2023-09-05 05:11:41.923892	71	EXECUTED	8:4223f561f3b8dc655846562b57bb502e	addColumn tableName=RESOURCE_SERVER		\N	4.16.1	\N	\N	3890700788
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-09-05 05:11:41.926117	72	EXECUTED	8:215a31c398b363ce383a2b301202f29e	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.16.1	\N	\N	3890700788
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-09-05 05:11:41.928347	73	EXECUTED	8:83f7a671792ca98b3cbd3a1a34862d3d	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.16.1	\N	\N	3890700788
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-09-05 05:11:41.929333	74	MARK_RAN	8:f58ad148698cf30707a6efbdf8061aa7	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.16.1	\N	\N	3890700788
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-09-05 05:11:41.935592	75	EXECUTED	8:79e4fd6c6442980e58d52ffc3ee7b19c	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.16.1	\N	\N	3890700788
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-09-05 05:11:41.939686	76	EXECUTED	8:87af6a1e6d241ca4b15801d1f86a297d	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.16.1	\N	\N	3890700788
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-09-05 05:11:41.94173	77	EXECUTED	8:b44f8d9b7b6ea455305a6d72a200ed15	addColumn tableName=CLIENT		\N	4.16.1	\N	\N	3890700788
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-09-05 05:11:41.942575	78	MARK_RAN	8:2d8ed5aaaeffd0cb004c046b4a903ac5	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.16.1	\N	\N	3890700788
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-09-05 05:11:41.951165	79	EXECUTED	8:e290c01fcbc275326c511633f6e2acde	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.16.1	\N	\N	3890700788
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-09-05 05:11:41.952159	80	MARK_RAN	8:c9db8784c33cea210872ac2d805439f8	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.16.1	\N	\N	3890700788
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-09-05 05:11:41.95617	81	EXECUTED	8:95b676ce8fc546a1fcfb4c92fae4add5	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.16.1	\N	\N	3890700788
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-09-05 05:11:41.957075	82	MARK_RAN	8:38a6b2a41f5651018b1aca93a41401e5	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.16.1	\N	\N	3890700788
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-09-05 05:11:41.959931	83	EXECUTED	8:3fb99bcad86a0229783123ac52f7609c	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.16.1	\N	\N	3890700788
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-09-05 05:11:41.96088	84	MARK_RAN	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.16.1	\N	\N	3890700788
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-09-05 05:11:41.964835	85	EXECUTED	8:ab4f863f39adafd4c862f7ec01890abc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.16.1	\N	\N	3890700788
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2023-09-05 05:11:41.968528	86	EXECUTED	8:13c419a0eb336e91ee3a3bf8fda6e2a7	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.16.1	\N	\N	3890700788
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2023-09-05 05:11:41.973127	87	EXECUTED	8:e3fb1e698e0471487f51af1ed80fe3ac	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.16.1	\N	\N	3890700788
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2023-09-05 05:11:41.978811	88	EXECUTED	8:babadb686aab7b56562817e60bf0abd0	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.16.1	\N	\N	3890700788
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-09-05 05:11:41.982551	89	EXECUTED	8:72d03345fda8e2f17093d08801947773	addColumn tableName=REALM; customChange		\N	4.16.1	\N	\N	3890700788
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-09-05 05:11:41.986462	90	EXECUTED	8:61c9233951bd96ffecd9ba75f7d978a4	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.16.1	\N	\N	3890700788
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-09-05 05:11:41.990733	91	EXECUTED	8:ea82e6ad945cec250af6372767b25525	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.16.1	\N	\N	3890700788
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-09-05 05:11:41.995046	92	EXECUTED	8:d3f4a33f41d960ddacd7e2ef30d126b3	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.16.1	\N	\N	3890700788
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-09-05 05:11:41.996106	93	MARK_RAN	8:1284a27fbd049d65831cb6fc07c8a783	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.16.1	\N	\N	3890700788
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-09-05 05:11:42.002395	94	EXECUTED	8:9d11b619db2ae27c25853b8a37cd0dea	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.16.1	\N	\N	3890700788
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-09-05 05:11:42.003374	95	MARK_RAN	8:3002bb3997451bb9e8bac5c5cd8d6327	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.16.1	\N	\N	3890700788
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-09-05 05:11:42.006685	96	EXECUTED	8:dfbee0d6237a23ef4ccbb7a4e063c163	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.16.1	\N	\N	3890700788
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-09-05 05:11:42.013681	97	EXECUTED	8:75f3e372df18d38c62734eebb986b960	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.16.1	\N	\N	3890700788
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-09-05 05:11:42.014702	98	MARK_RAN	8:7fee73eddf84a6035691512c85637eef	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.16.1	\N	\N	3890700788
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-09-05 05:11:42.021347	99	MARK_RAN	8:7a11134ab12820f999fbf3bb13c3adc8	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.16.1	\N	\N	3890700788
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-09-05 05:11:42.025954	100	EXECUTED	8:c0f6eaac1f3be773ffe54cb5b8482b70	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.16.1	\N	\N	3890700788
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-09-05 05:11:42.027285	101	MARK_RAN	8:18186f0008b86e0f0f49b0c4d0e842ac	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.16.1	\N	\N	3890700788
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-09-05 05:11:42.031612	102	EXECUTED	8:09c2780bcb23b310a7019d217dc7b433	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.16.1	\N	\N	3890700788
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-09-05 05:11:42.034646	103	EXECUTED	8:276a44955eab693c970a42880197fff2	customChange		\N	4.16.1	\N	\N	3890700788
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2023-09-05 05:11:42.037484	104	EXECUTED	8:ba8ee3b694d043f2bfc1a1079d0760d7	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.16.1	\N	\N	3890700788
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2023-09-05 05:11:42.041178	105	EXECUTED	8:5e06b1d75f5d17685485e610c2851b17	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.16.1	\N	\N	3890700788
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2023-09-05 05:11:42.044715	106	EXECUTED	8:4b80546c1dc550ac552ee7b24a4ab7c0	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.16.1	\N	\N	3890700788
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2023-09-05 05:11:42.047695	107	EXECUTED	8:af510cd1bb2ab6339c45372f3e491696	customChange		\N	4.16.1	\N	\N	3890700788
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2023-09-05 05:11:42.051599	108	EXECUTED	8:05c99fc610845ef66ee812b7921af0ef	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.16.1	\N	\N	3890700788
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2023-09-05 05:11:42.052799	109	MARK_RAN	8:314e803baf2f1ec315b3464e398b8247	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.16.1	\N	\N	3890700788
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2023-09-05 05:11:42.056882	110	EXECUTED	8:56e4677e7e12556f70b604c573840100	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.16.1	\N	\N	3890700788
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2023-09-05 05:11:42.059745	111	EXECUTED	8:8806cb33d2a546ce770384bf98cf6eac	customChange		\N	4.16.1	\N	\N	3890700788
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2023-09-05 05:11:42.078892	112	EXECUTED	8:fdb2924649d30555ab3a1744faba4928	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.16.1	\N	\N	3890700788
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2023-09-05 05:11:42.079973	113	MARK_RAN	8:1c96cc2b10903bd07a03670098d67fd6	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.16.1	\N	\N	3890700788
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
a499feb5-9be3-463d-8e41-bfa85aed27f4	0545b5ca-6590-4d11-a33a-2f39c123cf25	f
a499feb5-9be3-463d-8e41-bfa85aed27f4	e9e51bde-fec7-44b1-a23d-123f0dcd16a8	t
a499feb5-9be3-463d-8e41-bfa85aed27f4	ea6a3813-0f00-4f50-b344-16caaed12d47	t
a499feb5-9be3-463d-8e41-bfa85aed27f4	b6cf459a-f075-4d31-8945-75c1eb35d783	t
a499feb5-9be3-463d-8e41-bfa85aed27f4	843efda5-081d-4bfd-8cab-b7c2328fc311	f
a499feb5-9be3-463d-8e41-bfa85aed27f4	3ea530f7-8b0f-40fa-964a-f9f9ec93c326	f
a499feb5-9be3-463d-8e41-bfa85aed27f4	11a1b916-47fe-4094-bc38-be06b14dfed8	t
a499feb5-9be3-463d-8e41-bfa85aed27f4	7ec167f3-226b-44af-a4c3-8f0b45c1eeac	t
a499feb5-9be3-463d-8e41-bfa85aed27f4	7d05b1cc-925a-4e26-82ec-93c8241cc4e9	f
a499feb5-9be3-463d-8e41-bfa85aed27f4	460c4b11-54de-451c-9d9b-38c7f950d129	t
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	1c24bfe0-68ec-457a-8fb9-8f6fccde0ba5	t
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	43869505-7a24-424e-9ada-0cef970169a5	t
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	111caa50-b290-43a8-b04a-cce3c73dbefa	t
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	d5d707c6-4d4f-4bc9-8a5b-4e089040061d	t
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	474bd65f-db29-470c-a9c3-3ad8f8615a6f	t
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	0a18b98d-38e5-44d2-9332-1065b0c342dc	t
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	d24e8e94-f3ca-47d4-bb18-dd8ba81d1124	f
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	a86d5100-8b35-49e9-94c3-3952256a2ffc	f
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	d33b511f-1df4-4f3a-b4fd-8e7e0403f908	f
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	29945782-f537-4661-beb2-eb77c9d23669	f
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
40a88e5c-5097-458e-9212-a0439ea14f85	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693890972271	LOGIN_ERROR	\N
ee9f484a-b9e7-4141-b6a3-234e7bc8a461	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693890972656	LOGIN_ERROR	\N
ba3c5398-08d5-424c-8ada-7122fe574868	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693890972889	LOGIN_ERROR	\N
e1e17560-154b-4fa8-b6e5-2989bc4e3dc8	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891008702	LOGIN_ERROR	\N
d0a29ebc-8e1d-4dcb-90ba-38e2fa5f0220	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891084756	LOGIN_ERROR	\N
efbe31d4-768e-4e2f-aa5f-590a3ba5df78	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891134029	LOGIN_ERROR	\N
6b85fe37-fcc4-4bf6-b7d4-92d04f11f37e	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891134331	LOGIN_ERROR	\N
cd5eadab-ca60-4ca9-a7a5-205796e023e1	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891134516	LOGIN_ERROR	\N
a8825d30-6b76-4f79-890b-6a3e02f1e118	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891310446	LOGIN_ERROR	\N
2f0a8f64-0cc9-4cfe-b022-9bc62aec1e8e	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891310687	LOGIN_ERROR	\N
4b939c82-1f19-476c-91ed-908c2048e63d	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891310861	LOGIN_ERROR	\N
01dc9126-a95c-4588-80b4-46c0d5ca6814	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891402398	LOGIN_ERROR	\N
94ca389f-fc18-495d-8f51-ff9a38b9c354	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891666838	LOGIN_ERROR	\N
da735887-b62d-43ac-a643-a15bfa4de603	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891728414	LOGIN_ERROR	\N
6046e2e4-5f13-4afb-acae-2599e7b082dc	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891728701	LOGIN_ERROR	\N
787944d2-164f-4d55-b51f-9b150182f58c	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891728893	LOGIN_ERROR	\N
d6752f51-8484-439f-852b-016aae69cc3a	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891729072	LOGIN_ERROR	\N
eced845e-45d7-4401-b88c-3fb09967ef08	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891729237	LOGIN_ERROR	\N
4d266018-c55c-410f-beee-2681d6fe3651	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891729460	LOGIN_ERROR	\N
79c44a7e-f62c-496c-8ee1-3a2c68c1ec71	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891729625	LOGIN_ERROR	\N
2a561c21-b893-4648-8486-88148bdee454	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891729791	LOGIN_ERROR	\N
589ce5d6-db65-44cb-9bf0-86864c7ae5bf	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891729959	LOGIN_ERROR	\N
acd82a08-7365-4786-9c5c-1ebdb4be7e70	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891730125	LOGIN_ERROR	\N
2fe0a781-a649-403c-8744-572d32101e0f	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891730285	LOGIN_ERROR	\N
be4d2687-d974-4cf0-82ac-fdcd3ddce727	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891730471	LOGIN_ERROR	\N
f1235761-fb05-4db0-a4fc-e5eb0c78c8fe	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891730637	LOGIN_ERROR	\N
59b07017-3df8-49a7-bfd6-26280a0011a7	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891730803	LOGIN_ERROR	\N
0e3e4f34-b0d8-4201-9ede-7adf2bbce24c	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891730988	LOGIN_ERROR	\N
237422f5-5a02-49bd-a42f-effc0fa381e4	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891731153	LOGIN_ERROR	\N
65341aa8-84a9-4831-bad4-7e593bca4d12	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891731318	LOGIN_ERROR	\N
009b541f-ea66-4383-96b4-7a171a9e6537	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891731502	LOGIN_ERROR	\N
c815d3f4-941d-4087-89e7-524ccb60f06e	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891731669	LOGIN_ERROR	\N
1655d58a-0eaa-49a2-a2f1-85eeaefc5859	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891731844	LOGIN_ERROR	\N
cc2d878f-37c3-418f-b2a7-0aa5767e4838	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891732019	LOGIN_ERROR	\N
cf8a848f-ac18-478c-a301-e54e23b7649b	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891732227	LOGIN_ERROR	\N
c718157d-9329-4d52-9e48-de2f596148c8	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693891732383	LOGIN_ERROR	\N
d46fb8da-b542-4bf3-93a7-4c179f9fe756	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"875806027"}	user_not_found	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693911114792	LOGIN_ERROR	\N
b251377d-ba7a-4240-aba9-c66cd7ac1f9f	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"david13@example.com"}	user_not_found	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693911115118	LOGIN_ERROR	\N
6e597fdd-c4fb-470e-8bbb-6fbc9ad84af0	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"martinezjoanna@example.com"}	user_disabled	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693911121678	LOGIN_ERROR	d7e194b7-ce64-4b84-8820-1f1e46fce924
3ec8e69b-3b0c-4681-9e00-8358eb22fbf6	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"9377868929"}	user_not_found	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693911131639	LOGIN_ERROR	\N
8817b660-0a50-4ba4-bb67-a33a3be6e236	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"tammyjefferson@example.org"}	user_not_found	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693911132472	LOGIN_ERROR	\N
6cc376d8-285d-4f42-9d0d-7298efab2260	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"admin1@gmail.com"}	user_not_found	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1693911208125	LOGIN_ERROR	\N
e5e17927-ac87-4702-8249-01aef2603b24	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"0548976170"}	user_not_found	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694001880293	LOGIN_ERROR	\N
3774cb6c-b4f3-4756-ac2b-e303f74a1e72	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"kevin80@example.org"}	user_not_found	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694001880630	LOGIN_ERROR	\N
7a523f04-1d93-4a98-982d-eafc35a65d0b	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"austinrichardson@example.com"}	user_disabled	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694001887629	LOGIN_ERROR	402ba3bd-5f92-46d5-8456-fbc1ba0d0e93
866bc84f-2856-43e2-9707-023ebef3bdec	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"1153904922"}	user_not_found	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694001897904	LOGIN_ERROR	\N
771dd95e-325f-4661-97f0-b737f1042d23	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"boonederrick@example.com"}	user_not_found	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694001898724	LOGIN_ERROR	\N
c0b3fe31-5c3e-425b-aeeb-8f514d7949ee	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"admin1@gmail.com"}	user_not_found	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694002318221	LOGIN_ERROR	\N
3ad63cda-88b3-4445-971d-68e998571bd9	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694062706113	LOGIN_ERROR	\N
3b8440f3-69f4-41e0-9539-c4016adf6a75	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694062711644	LOGIN_ERROR	\N
b8a9bf9b-1023-4580-8991-58480e1927dc	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"6589141618"}	user_not_found	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694067819514	LOGIN_ERROR	\N
93675fe6-dc77-4388-80f2-a1ee0ee44c35	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret"}	user_not_found	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694491960050	LOGIN_ERROR	\N
5b522111-0f58-454c-b4ce-c4dacdf19fa2	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"sa@probeplus.in"}	user_not_found	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694491960274	LOGIN_ERROR	\N
3229f2f4-09f0-4004-b844-21b95f33e4c2	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"wileynicole@example.com"}	user_disabled	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694491966407	LOGIN_ERROR	e950f456-0322-45e3-95a1-60756d87504e
34bb633e-acae-44db-93e0-8de8b3e82e98	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"2764006784"}	user_not_found	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694491975922	LOGIN_ERROR	\N
f4dfe0c3-1a89-431b-a98b-71f0cce5d698	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"katherine57@example.net"}	user_not_found	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694491976665	LOGIN_ERROR	\N
38cdbf04-0af9-4ba6-a1b6-87e2b188ea9e	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"admin1@gmail.com"}	user_not_found	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694492475096	LOGIN_ERROR	\N
0fd29872-74c6-43b2-8ce5-d15874957c2c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499362075	CLIENT_LOGIN_ERROR	\N
a834ce73-e585-48c7-8782-5df2bd2e0ec3	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret"}	user_not_found	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499250979	LOGIN_ERROR	\N
a86c4c8f-453b-4612-8846-18f12b49a5c9	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"sa@probeplus.in"}	user_not_found	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499251205	LOGIN_ERROR	\N
e586f5e2-7f76-4d6d-adf3-ad5436d61e49	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"romerodaniel@example.com"}	user_disabled	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499257379	LOGIN_ERROR	f0f1a790-71dc-43e3-8f2d-d6c8ba61a76c
b97e0ed4-e0dc-43d4-8009-f99eacd3925c	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"8985366952"}	user_not_found	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499266716	LOGIN_ERROR	\N
edfd3fb4-82a9-4d16-a4a8-bcc78f747886	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"new_1@example.ai"}	user_not_found	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499267387	LOGIN_ERROR	\N
ddf0a71d-a0a8-42d7-af55-a268a6c1e112	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499359725	CLIENT_LOGIN_ERROR	\N
a5cedce1-a6e8-4fee-91fa-7072fd77e592	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499359834	CLIENT_LOGIN_ERROR	\N
483a08fd-c8fd-480f-8545-15e09cfc5641	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499360029	CLIENT_LOGIN_ERROR	\N
539d3c44-b8a2-454a-b39f-ef6c7224b361	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499360065	CLIENT_LOGIN_ERROR	\N
8952e206-bd49-43a3-8989-0531ce8f8d1d	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499360153	CLIENT_LOGIN_ERROR	\N
b643add7-60d7-4344-94f6-e6b99bcad49e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499360203	CLIENT_LOGIN_ERROR	\N
8160f4ad-6d8e-400c-bc02-c840065d328e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499360347	CLIENT_LOGIN_ERROR	\N
39182c1d-5c77-4a3d-afb8-6ae274760d37	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499360383	CLIENT_LOGIN_ERROR	\N
2a553d20-f02c-4a2c-9f8d-35fde2d6ffc1	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499360471	CLIENT_LOGIN_ERROR	\N
96f7ba89-75dc-4fc5-9c44-ccdf1d613080	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499360521	CLIENT_LOGIN_ERROR	\N
b6514372-1575-441f-9a36-fc672c0a74bd	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499360664	CLIENT_LOGIN_ERROR	\N
e58a6ddf-6688-4f38-b17f-f30646b6f772	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499360729	CLIENT_LOGIN_ERROR	\N
04fad5ba-5684-4c9b-bd02-3a0c0a329ec4	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499360815	CLIENT_LOGIN_ERROR	\N
d0c9dc5e-1077-4112-9c61-1381e9cc8892	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499360852	CLIENT_LOGIN_ERROR	\N
3dd0b5ac-8b5c-414c-9694-1364cd1ee524	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499360996	CLIENT_LOGIN_ERROR	\N
45d72056-a634-4d0f-a824-3d97c0467b5c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499361043	CLIENT_LOGIN_ERROR	\N
5cdae935-9381-445c-b21e-b53697e9d7c8	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499361126	CLIENT_LOGIN_ERROR	\N
68fd235b-65a7-45a1-ad40-e20a4d86d43c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499361161	CLIENT_LOGIN_ERROR	\N
74635b76-c0a1-4e73-9b1a-27238e37277c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499361301	CLIENT_LOGIN_ERROR	\N
2147800b-8c72-415f-89af-dbbab32b2d58	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499361338	CLIENT_LOGIN_ERROR	\N
8b7d12b8-0980-4ea6-b9c3-f765de40d6fe	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499361420	CLIENT_LOGIN_ERROR	\N
168dac02-4b7d-4094-bf9a-7333ae23d317	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499361456	CLIENT_LOGIN_ERROR	\N
db390c87-5bb7-48c0-8d35-64108036dfd7	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499361609	CLIENT_LOGIN_ERROR	\N
c1c53cb6-2228-45ef-a02f-c28662791345	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499361645	CLIENT_LOGIN_ERROR	\N
1c97c0fc-2471-47b0-ad41-ad8a81e793f8	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499361730	CLIENT_LOGIN_ERROR	\N
2aabcdb5-38e9-4c26-a40e-4e1139286f57	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499361767	CLIENT_LOGIN_ERROR	\N
36250b69-25e7-4748-913c-a1925d03b66a	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499361913	CLIENT_LOGIN_ERROR	\N
b6a92fd1-bd5e-47f4-938b-b159fb64be4a	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499361951	CLIENT_LOGIN_ERROR	\N
5509186e-23d8-4786-8a46-94b4137ed78b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499362038	CLIENT_LOGIN_ERROR	\N
759cf263-4c56-43c6-bbec-2ef94a5d3855	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499362217	CLIENT_LOGIN_ERROR	\N
4efa5df1-70d7-456f-9f31-8b8cb7ba4e6b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499362264	CLIENT_LOGIN_ERROR	\N
bbe5ccec-d133-4c53-ac68-bbdd9225ba93	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499362347	CLIENT_LOGIN_ERROR	\N
e8cb5708-16dd-4f9a-9fc3-2b5c10896fe7	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499362382	CLIENT_LOGIN_ERROR	\N
648a589e-b777-445a-8be3-3f882e207d7c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499362531	CLIENT_LOGIN_ERROR	\N
18ce9f68-1472-4263-b1a9-88ca2f6544e8	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499362573	CLIENT_LOGIN_ERROR	\N
e29ba5a8-b5ad-45f3-b6e4-f9f914964381	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499362669	CLIENT_LOGIN_ERROR	\N
d01de3ff-970e-4180-acba-0f3675a4d5a4	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499362711	CLIENT_LOGIN_ERROR	\N
cd22019c-9b74-4f35-b611-ec68eab3983e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499362883	CLIENT_LOGIN_ERROR	\N
e4d6711e-8048-4edb-b1cc-8554db97a816	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499362926	CLIENT_LOGIN_ERROR	\N
184576d9-bb62-4b2c-bdcc-d52b3116a8d3	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499363018	CLIENT_LOGIN_ERROR	\N
79c85d4c-eac2-49c3-a2e4-ed77555f1b1f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499363058	CLIENT_LOGIN_ERROR	\N
24af8bc1-f4d2-4dab-a73f-dcc77e82d034	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499363219	CLIENT_LOGIN_ERROR	\N
ccfe86e3-1bf0-4f19-8569-447556321bd0	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499363259	CLIENT_LOGIN_ERROR	\N
d5a16a74-9408-461a-b673-fa2a301aa56d	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499363352	CLIENT_LOGIN_ERROR	\N
e993dfd7-95b4-4a29-9ef3-f9ab2ee6d01f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499363390	CLIENT_LOGIN_ERROR	\N
057e71af-cfdc-438b-b0fa-235cd0fb1709	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499363533	CLIENT_LOGIN_ERROR	\N
1abcce9a-ad71-4baa-9215-85f92674fd48	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499363570	CLIENT_LOGIN_ERROR	\N
f1b74e1c-d6bd-4412-9310-8625605de579	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499363653	CLIENT_LOGIN_ERROR	\N
6b972562-dafb-4157-9bc2-1b1607ceac89	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499363690	CLIENT_LOGIN_ERROR	\N
2648582a-65ae-490d-b893-bf61582a6be5	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499363831	CLIENT_LOGIN_ERROR	\N
ce5dbfd6-6521-4eeb-8d80-355b6ad75474	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499363866	CLIENT_LOGIN_ERROR	\N
f278ed06-e973-4d75-8424-b30317b9e6f2	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499363957	CLIENT_LOGIN_ERROR	\N
3bb12569-64f1-4291-a376-0c829a9a7b54	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499364019	CLIENT_LOGIN_ERROR	\N
b6d7496a-bb81-4b01-aa89-5cb387d8486e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499364164	CLIENT_LOGIN_ERROR	\N
fcea6b75-5023-4e85-ac8d-d48ec08b880e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499364214	CLIENT_LOGIN_ERROR	\N
d01c8704-aef0-4e1c-866d-d752a1465c69	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499364316	CLIENT_LOGIN_ERROR	\N
745eba67-0eaa-40c3-8bb4-e517aea13135	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499364357	CLIENT_LOGIN_ERROR	\N
d852c2af-ab48-4e47-94cc-45fdec60ea17	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499364510	CLIENT_LOGIN_ERROR	\N
52f52fe4-6404-4408-ae7a-0a303a54bff6	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499364547	CLIENT_LOGIN_ERROR	\N
4659016c-c85f-4a85-b472-a977f5441275	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499364632	CLIENT_LOGIN_ERROR	\N
a1a63c2e-f868-4798-8353-b30d9b29c048	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499364672	CLIENT_LOGIN_ERROR	\N
e1bd46ed-3c36-4b3c-a89f-43f5accbf7bd	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499364833	CLIENT_LOGIN_ERROR	\N
3320273e-e7be-443b-967d-633d9d0dae53	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499364869	CLIENT_LOGIN_ERROR	\N
d68c908b-3fe4-48f6-9cc4-c8c0e31e78c4	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499364953	CLIENT_LOGIN_ERROR	\N
7d838c97-d07c-46d0-aefa-be0c70b9b651	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499364994	CLIENT_LOGIN_ERROR	\N
c9d1eca1-16b3-4eb4-8fdf-237a634cb2f0	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499365142	CLIENT_LOGIN_ERROR	\N
b356712f-4160-45f9-989d-f206ad5782c9	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499365192	CLIENT_LOGIN_ERROR	\N
dbbf9080-964c-48fb-b257-c5f5f1964631	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499365276	CLIENT_LOGIN_ERROR	\N
9754191a-9677-43ca-9411-48f802394ecc	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499365313	CLIENT_LOGIN_ERROR	\N
325440e7-2f19-485e-8156-c2cd0460685e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499365454	CLIENT_LOGIN_ERROR	\N
27e7780a-375c-4ccf-96e6-e219bf9ba9f8	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499365489	CLIENT_LOGIN_ERROR	\N
3b44187c-9f67-4b33-a006-cfba53f88aca	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499365582	CLIENT_LOGIN_ERROR	\N
b5caf012-9cde-43fc-9d86-d8a98baead93	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499365639	CLIENT_LOGIN_ERROR	\N
a4437c67-9287-4316-9a73-d1a05f0dc129	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499365781	CLIENT_LOGIN_ERROR	\N
b2f1b904-086c-4d6f-8671-d7dcfbf0fde6	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499365902	CLIENT_LOGIN_ERROR	\N
04a5e5c2-2c9a-4bfe-a229-3efc8f326f61	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499365986	CLIENT_LOGIN_ERROR	\N
5afad1b6-3352-4a72-8e1c-6a0ad2668250	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499366215	CLIENT_LOGIN_ERROR	\N
48c32904-5c61-449a-9211-e04c01302f58	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499366299	CLIENT_LOGIN_ERROR	\N
59421124-a5a1-4282-ba05-0e84323b38d7	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499366473	CLIENT_LOGIN_ERROR	\N
8dfb9acd-58d4-49d8-ac41-3fb0cc8b0970	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499366608	CLIENT_LOGIN_ERROR	\N
2573653e-326f-44d0-995b-0fa765158e1c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499366790	CLIENT_LOGIN_ERROR	\N
b5bed0ea-018c-4a88-967c-7429a3dc684b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499366941	CLIENT_LOGIN_ERROR	\N
b2c6918a-03d1-430e-9f79-bc7486460fd4	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499367115	CLIENT_LOGIN_ERROR	\N
5e603c58-6189-475b-9db4-a37900ed64ed	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499367197	CLIENT_LOGIN_ERROR	\N
12d2957a-0fe4-4094-88d9-4bf183414447	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499367428	CLIENT_LOGIN_ERROR	\N
f55d4759-9110-4b8c-b03d-0d43d6c59d53	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499367516	CLIENT_LOGIN_ERROR	\N
58ac6278-44fd-42df-8ed1-389feeda2821	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499367713	CLIENT_LOGIN_ERROR	\N
681ec1db-5b7d-45c0-b697-bb197eedae63	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499367862	CLIENT_LOGIN_ERROR	\N
7eb8ed37-16fc-461a-84fd-f164061ebc30	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499367878	CLIENT_LOGIN_ERROR	\N
660244a4-ed5b-4b72-9ca8-ff177724ff78	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499367965	CLIENT_LOGIN_ERROR	\N
54f9d265-9cfd-47c4-917c-5b708e20d09d	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499368001	CLIENT_LOGIN_ERROR	\N
e0e7bc85-718d-432a-9cfb-f956064eaba5	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499368178	CLIENT_LOGIN_ERROR	\N
73f19eb2-88ae-40eb-81dc-07085b5fb490	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499368217	CLIENT_LOGIN_ERROR	\N
39fe6ab7-d735-44bf-86c9-0db923967fb7	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499368313	CLIENT_LOGIN_ERROR	\N
e0e57b25-d8f3-46eb-9524-dee612df1828	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499368350	CLIENT_LOGIN_ERROR	\N
500700cc-0df4-4cc1-80de-b9b1b2e64435	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499368520	CLIENT_LOGIN_ERROR	\N
23244910-235d-44b6-9da4-192cb13c7a3c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499368560	CLIENT_LOGIN_ERROR	\N
318c0b7b-a35b-45ed-bdbb-3bcf2dca6661	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499368648	CLIENT_LOGIN_ERROR	\N
845357b5-368d-4b07-8103-e4111f4a01c5	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499368686	CLIENT_LOGIN_ERROR	\N
fb1816f7-a282-4d80-8fc6-7c4faa8adb0f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499368868	CLIENT_LOGIN_ERROR	\N
e9ccefc1-ff20-4d9d-815f-0f0277f54971	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499368931	CLIENT_LOGIN_ERROR	\N
bbe7375c-4535-4e81-88c5-65f2563dda41	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499369015	CLIENT_LOGIN_ERROR	\N
8f5ac688-af9f-49a1-a837-28c26da1e8e6	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499369055	CLIENT_LOGIN_ERROR	\N
3bfff563-c0f4-4e98-9074-edb3c90cb4ec	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499369197	CLIENT_LOGIN_ERROR	\N
86b94022-df92-452d-818b-2754ab423568	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499369233	CLIENT_LOGIN_ERROR	\N
73f8966c-8eda-4e33-85a7-68977eca9701	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499369315	CLIENT_LOGIN_ERROR	\N
da002b18-d5d1-4ba8-bd05-ef1301d135b2	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499369351	CLIENT_LOGIN_ERROR	\N
d5ad25c5-195b-47db-89eb-436a9bb14878	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499369498	CLIENT_LOGIN_ERROR	\N
85beeea8-8540-4156-8e6a-c43a2f1787ba	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499369537	CLIENT_LOGIN_ERROR	\N
8387109b-b2e7-47f1-a514-b665012e481c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499369634	CLIENT_LOGIN_ERROR	\N
fec37d6c-0073-454d-91c6-b325d2667f2d	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499369670	CLIENT_LOGIN_ERROR	\N
e56e2270-4c24-4181-8f50-e048a82978aa	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499369826	CLIENT_LOGIN_ERROR	\N
971b27b9-8dd2-4402-9e58-f5525f23f4de	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499369871	CLIENT_LOGIN_ERROR	\N
941876bd-5ded-46d8-b8ab-46d15fafc6d5	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499369953	CLIENT_LOGIN_ERROR	\N
34b9787b-f583-4640-9981-c40135804c2c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499369990	CLIENT_LOGIN_ERROR	\N
f53d09c0-4a48-4241-a973-4a5d06df09bb	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499370137	CLIENT_LOGIN_ERROR	\N
f83d097e-7680-4880-92d8-47af74946979	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499370173	CLIENT_LOGIN_ERROR	\N
98f6576a-69e1-402c-8461-e1e5b7cd473f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499370256	CLIENT_LOGIN_ERROR	\N
53dceb43-2b46-4986-9ab9-78c2114e8154	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499370291	CLIENT_LOGIN_ERROR	\N
e58583ad-e69b-4931-9499-97b1626d827d	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499370441	CLIENT_LOGIN_ERROR	\N
703976d1-ac70-4693-b89b-9e0fb7ecbd36	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499370479	CLIENT_LOGIN_ERROR	\N
2b35c61b-9ba1-4a4b-ba19-56d4e59b38f7	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499370565	CLIENT_LOGIN_ERROR	\N
b797c7e0-f03c-48db-911c-0e7cd94725cd	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499370609	CLIENT_LOGIN_ERROR	\N
3afc00fd-a380-4e51-867d-d8a10372b9a3	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499370753	CLIENT_LOGIN_ERROR	\N
4a4e9887-902d-4c60-b7ad-6ce83845a4d1	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499370789	CLIENT_LOGIN_ERROR	\N
a733465b-8c1f-43ac-93ee-586d8c44c0c8	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499370875	CLIENT_LOGIN_ERROR	\N
d643b39a-e75f-41ca-822c-3bd57cc72432	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499370912	CLIENT_LOGIN_ERROR	\N
8721189b-8f53-4811-873a-6179a9f8a6ef	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499371059	CLIENT_LOGIN_ERROR	\N
795815e0-680f-4c56-92fc-7554c6c36018	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499371105	CLIENT_LOGIN_ERROR	\N
86658e2d-7daa-433d-9b78-caab5149e1c9	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499371189	CLIENT_LOGIN_ERROR	\N
f79c0b4a-175b-4d3a-86ea-0b1508893db6	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499371225	CLIENT_LOGIN_ERROR	\N
00c14140-a0ef-4c55-86b1-0b1b28c4e166	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499371377	CLIENT_LOGIN_ERROR	\N
0c463b9f-9ef0-429d-b7c8-2fc19d9cc14a	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499371433	CLIENT_LOGIN_ERROR	\N
4d7313e0-1bb8-41f7-97e1-9ff6d9874089	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499371516	CLIENT_LOGIN_ERROR	\N
aecd87bd-a5aa-4559-86a6-453577fdbca5	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499371563	CLIENT_LOGIN_ERROR	\N
718fc134-c3a5-41dc-ad63-55896451127b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499371709	CLIENT_LOGIN_ERROR	\N
283c5ac5-61d7-4d34-87da-9239c9c87853	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499371763	CLIENT_LOGIN_ERROR	\N
83caaa5e-157d-4a7c-b4e7-203eb3f3f23b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499371848	CLIENT_LOGIN_ERROR	\N
2beaec28-dec9-4c75-8f5a-76ead0081d83	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499371883	CLIENT_LOGIN_ERROR	\N
b9769cee-cb20-4f53-8477-3b0ef39e8fec	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499372033	CLIENT_LOGIN_ERROR	\N
bf40fb3b-2478-4096-80e8-baa21b363151	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499372069	CLIENT_LOGIN_ERROR	\N
b8b14850-7a19-4c2b-aca9-ab9941047c6a	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499372152	CLIENT_LOGIN_ERROR	\N
cf4717fc-e982-4456-a9c9-a27d9f13aee4	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499372187	CLIENT_LOGIN_ERROR	\N
c840b238-64f3-408e-844e-ee6d0454f4f5	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499372335	CLIENT_LOGIN_ERROR	\N
434aaaed-16e6-4ebe-98f8-c4c1042d180f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499372371	CLIENT_LOGIN_ERROR	\N
7fb647e0-07ce-40e0-9b05-a48988d0dd46	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499372454	CLIENT_LOGIN_ERROR	\N
9848a615-faef-4721-ba1f-6f7f9e19a822	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499372490	CLIENT_LOGIN_ERROR	\N
d265a1aa-eb30-417c-a2d4-1732018dd058	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499372634	CLIENT_LOGIN_ERROR	\N
8dca0c3f-de7e-4bf4-8847-965e735574a8	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499372670	CLIENT_LOGIN_ERROR	\N
05631aea-f57b-4555-87c2-162957abb7e2	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499372755	CLIENT_LOGIN_ERROR	\N
ca511338-d3ae-4caa-a2ad-feed9d5f3275	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499372815	CLIENT_LOGIN_ERROR	\N
2669fef8-1c4e-4100-9693-b50b645c907e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499372971	CLIENT_LOGIN_ERROR	\N
d0b7c583-5bcc-4c43-8a5e-54863ac9caae	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499373011	CLIENT_LOGIN_ERROR	\N
44f7f4e3-d52a-44cf-9693-96b8306e6299	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499373098	CLIENT_LOGIN_ERROR	\N
51e76529-e5ec-4971-bb41-7976a71e7353	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499373143	CLIENT_LOGIN_ERROR	\N
a35ea9dc-2483-49a4-921a-f412582df54b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499373293	CLIENT_LOGIN_ERROR	\N
c6968dda-9829-4b0c-acdc-d2b483df6e35	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499373363	CLIENT_LOGIN_ERROR	\N
720faf6d-aa2f-4621-9939-a88213ba84b7	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499373445	CLIENT_LOGIN_ERROR	\N
aae6492c-18f9-4b88-8971-550df071bdb3	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499373483	CLIENT_LOGIN_ERROR	\N
5a56a455-6bd3-410e-ba19-692a223a1f06	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499373628	CLIENT_LOGIN_ERROR	\N
8e558be6-5e0a-4db3-b583-0abff2ae4af2	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499373663	CLIENT_LOGIN_ERROR	\N
eb72ccbd-c36b-4856-abbf-dd030088ab78	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499373748	CLIENT_LOGIN_ERROR	\N
2aac3032-fbcf-491e-9838-f463ceaba846	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499373806	CLIENT_LOGIN_ERROR	\N
8e39c9db-6070-4266-8969-35e7afa1bb08	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499373953	CLIENT_LOGIN_ERROR	\N
ebdc795d-3fac-4daf-a958-a3be29fba899	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499373988	CLIENT_LOGIN_ERROR	\N
69e17691-4522-4305-97ef-6c3397cb1472	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499374079	CLIENT_LOGIN_ERROR	\N
4d46f4d3-8630-4b36-a1bb-7a0c6f89dcf7	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499374135	CLIENT_LOGIN_ERROR	\N
9225e915-3541-40f3-b7e0-9d8d04609000	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499374283	CLIENT_LOGIN_ERROR	\N
80e9b75c-9ede-471c-806f-aa13626ff16c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499374326	CLIENT_LOGIN_ERROR	\N
c660f9e6-ed5f-4dcf-89b0-5d9bdf74c56c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499374412	CLIENT_LOGIN_ERROR	\N
7dce24e7-99c1-4ef2-b5b1-8803830b8a0c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499374447	CLIENT_LOGIN_ERROR	\N
034a08e5-1182-45de-bffa-f1e4ae4295cc	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499374595	CLIENT_LOGIN_ERROR	\N
45322c51-33d1-4e19-b2b0-bb7e79ebb0c3	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499374632	CLIENT_LOGIN_ERROR	\N
526c71bb-3765-49db-87e9-252f575f164b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499374716	CLIENT_LOGIN_ERROR	\N
9a20d1c5-4093-49c1-82b7-80cddaff5535	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499374752	CLIENT_LOGIN_ERROR	\N
d4a57c0c-4b08-49b2-b6e5-c310ea930724	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499374896	CLIENT_LOGIN_ERROR	\N
54a388bb-6fef-4781-9eea-8aa4f567d9ed	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499374933	CLIENT_LOGIN_ERROR	\N
8a5ff992-b7f3-442c-a10a-8c9ababebe74	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499375018	CLIENT_LOGIN_ERROR	\N
67b280d6-854e-4709-bea5-12ea07de2a3f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499375054	CLIENT_LOGIN_ERROR	\N
8873155d-20fd-4b1a-917c-0dfa524517d6	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499375215	CLIENT_LOGIN_ERROR	\N
d8783d93-1541-45fb-b1b0-a7e17bad39b9	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499375259	CLIENT_LOGIN_ERROR	\N
15a2d6b5-732b-47c1-9dab-8924858278c8	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499375342	CLIENT_LOGIN_ERROR	\N
714b5a22-8d50-46db-a5d9-b57d1cbb1adc	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499375387	CLIENT_LOGIN_ERROR	\N
27cbdc08-e6d2-49de-a316-bdea35f0160c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499375546	CLIENT_LOGIN_ERROR	\N
7932a294-3af5-452f-bbec-05a692b002cd	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499375592	CLIENT_LOGIN_ERROR	\N
a9eda8c9-e7da-4acd-9a4a-565f3ef9f69f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499375679	CLIENT_LOGIN_ERROR	\N
42065fde-af36-43a6-b082-87295ebcf5fb	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499375720	CLIENT_LOGIN_ERROR	\N
adda3c6f-de72-4113-8037-deee35a89e9f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499375876	CLIENT_LOGIN_ERROR	\N
eabed626-f24d-4724-a0df-9d802b5d4954	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499375922	CLIENT_LOGIN_ERROR	\N
a100b66e-7c19-4f98-afce-d8c8e62b05ff	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499376010	CLIENT_LOGIN_ERROR	\N
71903ea2-a59a-4a98-808e-d1d871b3f325	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499376046	CLIENT_LOGIN_ERROR	\N
a70ddda8-c251-42e6-83a2-9f13ba0ef283	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499376197	CLIENT_LOGIN_ERROR	\N
7e150e35-f7e7-423a-8bc3-a91057595bbc	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499376250	CLIENT_LOGIN_ERROR	\N
43ddf336-2cf7-45c1-b728-a81e0f421963	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499376334	CLIENT_LOGIN_ERROR	\N
d89eee4e-4695-4eb1-8caa-d1d68e229830	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499376370	CLIENT_LOGIN_ERROR	\N
812eedc6-4a1c-4c67-9631-0543112fa4f9	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499376516	CLIENT_LOGIN_ERROR	\N
d3f48ab8-9f52-4e97-af5b-031f76f4a751	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499376552	CLIENT_LOGIN_ERROR	\N
df6ee3cb-3dbc-4992-b8f0-e99581400b92	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499376641	CLIENT_LOGIN_ERROR	\N
ad920865-acfd-42be-8798-337df6161189	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499376681	CLIENT_LOGIN_ERROR	\N
9738ec53-eda5-482d-b17b-a00d39e1c619	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499376849	CLIENT_LOGIN_ERROR	\N
c0358a86-7d65-4e68-829b-d523c6e32dce	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499376899	CLIENT_LOGIN_ERROR	\N
5caafc83-f269-4a12-9d54-28951e49e117	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499376992	CLIENT_LOGIN_ERROR	\N
bfbb35a0-d05d-4a87-801a-4e37bae016e7	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499377036	CLIENT_LOGIN_ERROR	\N
5441842b-52a2-4bc8-a78d-81bb0f999e77	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499377180	CLIENT_LOGIN_ERROR	\N
d7a3cc03-b6b2-4a34-a99f-f6cac1dbf210	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499377229	CLIENT_LOGIN_ERROR	\N
4732cf55-886a-4b06-ae63-0823821b7ebf	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499377326	CLIENT_LOGIN_ERROR	\N
50d926fa-eeeb-4f2c-879a-fb40996ecb96	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499377368	CLIENT_LOGIN_ERROR	\N
1f02be85-f531-4a66-add5-5bfb1df7e566	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499377562	CLIENT_LOGIN_ERROR	\N
690d1204-713c-4561-b858-99f2b0b35d64	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499377600	CLIENT_LOGIN_ERROR	\N
94a86c6e-9863-4ffa-87d0-3f65012a4d50	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499377699	CLIENT_LOGIN_ERROR	\N
31a0a26b-b320-4268-a0c7-34eed71969a0	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499377743	CLIENT_LOGIN_ERROR	\N
77ade542-d06a-4fd4-a3e2-18f2f71a9a1d	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499377943	CLIENT_LOGIN_ERROR	\N
3cf5811e-2b98-4b00-bc08-e228c0ae72aa	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499377982	CLIENT_LOGIN_ERROR	\N
c27eebdf-9d90-4a1f-ac99-da07fdb6c180	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499378071	CLIENT_LOGIN_ERROR	\N
01b60030-1933-4f09-bcf8-54cd98fc2455	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499378111	CLIENT_LOGIN_ERROR	\N
651d7dc7-83bb-4b1c-91d5-7ed2aa1c495b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499378279	CLIENT_LOGIN_ERROR	\N
a5535946-e53a-4fc5-8339-795e23af38a4	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499378316	CLIENT_LOGIN_ERROR	\N
7eff9612-b327-45ee-bd1c-72d6028bb65e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499378404	CLIENT_LOGIN_ERROR	\N
6b94cd5b-10d6-4b69-a0ff-7d0412b8ccff	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499378443	CLIENT_LOGIN_ERROR	\N
f43a497b-d867-4c31-8d72-bb4564a0d798	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499378601	CLIENT_LOGIN_ERROR	\N
3e3d7206-e483-49e5-bcf0-7ca64e3a5e3f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499378639	CLIENT_LOGIN_ERROR	\N
a9f7876e-4a17-43d3-bf00-7800b23eef24	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499378723	CLIENT_LOGIN_ERROR	\N
5af9561a-0d98-4fa7-993d-22844e8a6e2c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499378764	CLIENT_LOGIN_ERROR	\N
39226684-6ff9-4e5e-91a7-fff04aa8bfab	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499378939	CLIENT_LOGIN_ERROR	\N
331a2e9d-5930-4d49-91ed-d31d516fc5b1	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499378974	CLIENT_LOGIN_ERROR	\N
b168d0ea-eaea-4715-925f-556b40e2f4f6	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499379061	CLIENT_LOGIN_ERROR	\N
7853b751-c342-460e-99fa-19562f31b91a	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499379100	CLIENT_LOGIN_ERROR	\N
c3c7c059-7077-4fd8-b6d7-b334a7104ca8	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499379266	CLIENT_LOGIN_ERROR	\N
aea092d6-d82c-42bc-85e3-997e4efdc53b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499379300	CLIENT_LOGIN_ERROR	\N
69c7ee29-c23f-4838-bc26-b356358a2c38	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499379388	CLIENT_LOGIN_ERROR	\N
f1cc84f0-dae4-4b2b-a91a-01e23c382c44	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499379425	CLIENT_LOGIN_ERROR	\N
b9dc3c60-de39-44d1-9a78-aad6209d2965	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499379586	CLIENT_LOGIN_ERROR	\N
88c7bef4-8c3a-44d9-b2c8-c0f3dec2f718	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499379639	CLIENT_LOGIN_ERROR	\N
a1180037-23a7-4295-81e3-d5dee56c6370	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499379720	CLIENT_LOGIN_ERROR	\N
44182876-9251-4ed3-ab83-bf486b34f735	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499379779	CLIENT_LOGIN_ERROR	\N
b7559e59-0e1d-43ef-bb1a-38264bc9ed48	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499379942	CLIENT_LOGIN_ERROR	\N
10348695-6ae8-4d00-8935-94e5d98c6865	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499379980	CLIENT_LOGIN_ERROR	\N
8fc4931c-790a-4ff5-b3fa-9526eea87e96	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499380065	CLIENT_LOGIN_ERROR	\N
803da91c-6636-438d-bffe-16e170c17608	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499380101	CLIENT_LOGIN_ERROR	\N
6e513c54-5618-4546-8f43-390a796193d4	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499380277	CLIENT_LOGIN_ERROR	\N
2d08981b-9abc-4bcf-bc30-6d4270672063	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499380331	CLIENT_LOGIN_ERROR	\N
0f7cc554-3add-4afe-bd75-64fc255f3f55	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499380422	CLIENT_LOGIN_ERROR	\N
c1ff5743-cfbb-4a6c-8ad6-910aa31d3f34	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499380459	CLIENT_LOGIN_ERROR	\N
5d94268d-f4c5-4d20-bd19-3f01bbb07521	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499380646	CLIENT_LOGIN_ERROR	\N
f02218b6-832a-47e2-9ea3-75c81df1bc36	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499380697	CLIENT_LOGIN_ERROR	\N
2ac28dc7-b665-4285-a9d8-09c2d4b0e44b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499380793	CLIENT_LOGIN_ERROR	\N
caef804f-c9f2-4c6b-b811-b6a9dbabacb4	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499380832	CLIENT_LOGIN_ERROR	\N
428a2c29-c742-4a03-921f-e15ecfc02bb6	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499381015	CLIENT_LOGIN_ERROR	\N
6b8fc7f7-fd04-467d-8401-363358d938d6	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499381058	CLIENT_LOGIN_ERROR	\N
9432b829-48b3-4b52-8d40-3ccd1674bb13	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499381150	CLIENT_LOGIN_ERROR	\N
a733ffcc-e45b-490f-a066-651e01b2d891	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499381193	CLIENT_LOGIN_ERROR	\N
5d46732b-b807-4fce-bb2e-66d4b6428f34	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499381356	CLIENT_LOGIN_ERROR	\N
a6eb23bd-fc96-40b9-aa32-75059cf13a6c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499381391	CLIENT_LOGIN_ERROR	\N
378bdd18-2234-433f-ae42-e16c022a18d1	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499381483	CLIENT_LOGIN_ERROR	\N
14d4d810-d55f-4b6a-b363-169c92c6f2ad	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499381526	CLIENT_LOGIN_ERROR	\N
26ee66c1-4c86-4330-9831-b099b7e47eda	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499381692	CLIENT_LOGIN_ERROR	\N
6d669153-8bb9-4431-8f09-9082fedf247d	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499381733	CLIENT_LOGIN_ERROR	\N
10743649-c22f-453a-912d-fdc37c619465	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499381831	CLIENT_LOGIN_ERROR	\N
fab16464-68bc-4e46-b71d-213f58ec1d02	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499381869	CLIENT_LOGIN_ERROR	\N
80b2fb8a-c99b-4152-81d2-222ee71b32d2	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499382030	CLIENT_LOGIN_ERROR	\N
86d45e1b-47fb-492c-b61b-d5aaf3597fae	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499382078	CLIENT_LOGIN_ERROR	\N
927f7c6c-a212-4d8d-bdbc-f289770215ea	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499382163	CLIENT_LOGIN_ERROR	\N
71c958e1-819f-4c2a-9c57-d2fbb44a7bcb	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499382222	CLIENT_LOGIN_ERROR	\N
0de26625-9d66-46d0-bb10-81088a13a5e3	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499382383	CLIENT_LOGIN_ERROR	\N
d223436a-e583-4193-8c87-a3f660e0f61e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499382418	CLIENT_LOGIN_ERROR	\N
90bf8f77-ad40-4183-8cb8-85b831f11693	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499382506	CLIENT_LOGIN_ERROR	\N
12d62df5-9385-480d-aea8-a4fc468fefff	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499382571	CLIENT_LOGIN_ERROR	\N
cd5ec578-98dd-42d4-b3ea-c70d4b862138	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499382739	CLIENT_LOGIN_ERROR	\N
b84e1123-0051-4384-8e28-0068cfbb35fa	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499382784	CLIENT_LOGIN_ERROR	\N
f8e477e7-4a79-46e0-8c66-347acc58191f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499382871	CLIENT_LOGIN_ERROR	\N
4de8b604-e1c6-4392-ac26-7086d3faf825	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499382920	CLIENT_LOGIN_ERROR	\N
6f5a4372-829b-4d72-a9d9-cff3a878890e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499383076	CLIENT_LOGIN_ERROR	\N
5f5db162-851b-475a-b9c2-3434b4bdde89	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499383112	CLIENT_LOGIN_ERROR	\N
2a85f5e1-ddf6-47d1-8c86-4a287150eff7	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499383195	CLIENT_LOGIN_ERROR	\N
b307e9b5-53db-4578-90b7-7c431782c02b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499383240	CLIENT_LOGIN_ERROR	\N
b18ac570-c1d2-4665-b073-2cb52d4dfecb	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499383394	CLIENT_LOGIN_ERROR	\N
7348652c-863f-40bd-b978-786ae549a06f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499383430	CLIENT_LOGIN_ERROR	\N
0117fe27-b99c-41a9-9b09-a7d95f98348f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499383514	CLIENT_LOGIN_ERROR	\N
9233c2fa-5eeb-4dab-b673-c9813901739e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499383550	CLIENT_LOGIN_ERROR	\N
7edeb085-f788-4191-b395-0fd70c42082c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499383699	CLIENT_LOGIN_ERROR	\N
8c6940c8-691c-4d06-a0fe-50208eac0b72	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499383744	CLIENT_LOGIN_ERROR	\N
408ffe1e-265c-45d5-930d-31e31f56de2d	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499383830	CLIENT_LOGIN_ERROR	\N
8388c340-4079-420a-bca4-c510dabf1837	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499383867	CLIENT_LOGIN_ERROR	\N
d4ec1727-bc19-44fa-b0d9-a58b0b478b43	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499384015	CLIENT_LOGIN_ERROR	\N
46d4e3c5-38e2-48ca-8ea6-e72cc3236434	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499384060	CLIENT_LOGIN_ERROR	\N
abcfe725-5ad7-45c6-891e-d99c21ab1930	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499384149	CLIENT_LOGIN_ERROR	\N
1dbab79b-257c-45c8-9027-55d3bbaef531	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499384186	CLIENT_LOGIN_ERROR	\N
dfd8661c-3d52-46ed-bf56-61eb603b6f03	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499384347	CLIENT_LOGIN_ERROR	\N
b723b897-31be-4a24-bd01-f33366336129	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499384386	CLIENT_LOGIN_ERROR	\N
d2531eb0-9f74-447d-8da4-d8d61f9e3804	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499384484	CLIENT_LOGIN_ERROR	\N
10fceca0-cfbe-4108-9492-e3741aaa6840	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499384523	CLIENT_LOGIN_ERROR	\N
89e13737-9fa6-42d3-909f-6111bea6a29c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499384668	CLIENT_LOGIN_ERROR	\N
6688d23f-2f17-4205-ac9f-a8bef6ea1b20	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499384704	CLIENT_LOGIN_ERROR	\N
f2cb70cc-b818-432f-910d-9d0de83944bb	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499384790	CLIENT_LOGIN_ERROR	\N
55fc0dca-8255-4c04-9cb1-5bca9e1490e5	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499384807	CLIENT_LOGIN_ERROR	\N
0b1ed3a3-a893-46a8-ba53-5cbe91a80951	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499384962	CLIENT_LOGIN_ERROR	\N
68f7b68b-4208-47a2-b0e1-443ee6c62a05	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499385020	CLIENT_LOGIN_ERROR	\N
ad047bbf-e18d-4ece-9783-79995c218b43	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499385103	CLIENT_LOGIN_ERROR	\N
ffefa456-711a-4764-8a33-238949ff4bc3	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499385145	CLIENT_LOGIN_ERROR	\N
4014053e-5b4c-4026-b6c1-e6fdf4320e91	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499385306	CLIENT_LOGIN_ERROR	\N
fc690c76-9789-411e-bfb3-d8543133239f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499385345	CLIENT_LOGIN_ERROR	\N
7fbd5d67-4470-4b98-887f-5f14285a1448	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499385426	CLIENT_LOGIN_ERROR	\N
d4b7c602-662b-45c9-b8d1-ad1e352d697e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499385462	CLIENT_LOGIN_ERROR	\N
895cb592-6864-42c6-9e26-e824c65ea12d	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499385625	CLIENT_LOGIN_ERROR	\N
6a0871f3-353c-45bb-a9f3-bd2e5609d82d	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499385671	CLIENT_LOGIN_ERROR	\N
913e4528-20a7-43a1-ac87-fafcea141596	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499385754	CLIENT_LOGIN_ERROR	\N
963e11a2-4cc9-4775-af17-2b38c5ed77fe	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499385790	CLIENT_LOGIN_ERROR	\N
fbd1aaaa-c404-4334-87a8-b600b59eeb93	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499385949	CLIENT_LOGIN_ERROR	\N
c34f998f-5736-47cf-947d-7de4979aec48	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499385986	CLIENT_LOGIN_ERROR	\N
7426dbbd-8413-4650-91e7-452c1f321e73	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499386069	CLIENT_LOGIN_ERROR	\N
d3560171-d615-4785-a491-fb9ad5004ef2	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499386110	CLIENT_LOGIN_ERROR	\N
94802792-aaca-4258-b752-36a0e4e43c34	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499386274	CLIENT_LOGIN_ERROR	\N
74c5fba0-d15d-40e3-a0a2-eaa959b17d75	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499386320	CLIENT_LOGIN_ERROR	\N
41360f70-0f0d-4023-8813-6682556894ce	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499386407	CLIENT_LOGIN_ERROR	\N
3c7ddc3f-60e3-43bf-83cd-803442cf530d	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499386457	CLIENT_LOGIN_ERROR	\N
1239dbb3-3db2-466d-b1f3-6ca81c8da150	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499386613	CLIENT_LOGIN_ERROR	\N
6c150aeb-8d92-44e4-8bf6-af3003a8d8c9	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499386650	CLIENT_LOGIN_ERROR	\N
ae233b61-62da-4152-8e2f-3d19f63ea747	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499386732	CLIENT_LOGIN_ERROR	\N
698cf762-a49d-4ea3-8c7e-d63c02aced6e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499386768	CLIENT_LOGIN_ERROR	\N
d311e423-c7de-4024-a24d-e0b1dc0a3892	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499386918	CLIENT_LOGIN_ERROR	\N
0c23ae60-57e6-497b-90df-2e5bfa1f6599	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499386954	CLIENT_LOGIN_ERROR	\N
2a25ea34-b1a5-4ca8-858a-a934b94a9deb	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499387046	CLIENT_LOGIN_ERROR	\N
f691680c-2c80-4330-adaa-0a3d8d41c6a8	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499387110	CLIENT_LOGIN_ERROR	\N
68f5fe3f-2905-482f-9365-8e50e48b0448	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499387257	CLIENT_LOGIN_ERROR	\N
3e5d70ea-a8ce-4aec-8114-fabdd86d3b31	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499387293	CLIENT_LOGIN_ERROR	\N
007577f3-1ebb-4f9a-9ce5-b26e6b29782b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499387376	CLIENT_LOGIN_ERROR	\N
9a49e560-2447-4094-a42c-6d13e55b6ee7	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499387416	CLIENT_LOGIN_ERROR	\N
3e795079-1808-4cfd-aae9-dbf1294e1761	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499387563	CLIENT_LOGIN_ERROR	\N
6182008c-7602-4619-b72e-a33c2b12c721	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499387629	CLIENT_LOGIN_ERROR	\N
e8aed3ad-118c-40a7-9ca2-a1194dd692e1	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499387712	CLIENT_LOGIN_ERROR	\N
ec286e85-2362-4615-ac7a-eb20eb608195	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499387749	CLIENT_LOGIN_ERROR	\N
149d73e6-1978-477b-aaf7-ee440c13b9db	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499387899	CLIENT_LOGIN_ERROR	\N
542aab4b-5f22-40ee-9671-cce2883c7083	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499387935	CLIENT_LOGIN_ERROR	\N
ccd28dd1-21ac-40a4-9343-c036cf28aa30	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499388018	CLIENT_LOGIN_ERROR	\N
09dee1b9-e121-4480-8ad5-c444a62803d6	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499388054	CLIENT_LOGIN_ERROR	\N
8e45add6-cf28-46a9-a434-98cea31de148	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499388197	CLIENT_LOGIN_ERROR	\N
a2791fbd-9f33-4682-a270-accfcfdc570d	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499388233	CLIENT_LOGIN_ERROR	\N
e477ffea-f414-4511-91cb-a9a20bfa98ef	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499388321	CLIENT_LOGIN_ERROR	\N
91eea00b-7d75-4901-b17e-daf5e9ddc6b1	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499388363	CLIENT_LOGIN_ERROR	\N
ebe8a9cd-9bee-4b76-aa4d-f6f190224cfd	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499388514	CLIENT_LOGIN_ERROR	\N
b2f8f57c-2039-48e2-a208-591b8b406ddb	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499388570	CLIENT_LOGIN_ERROR	\N
10bf9ce9-a9ad-4e79-858a-7d34768269d0	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499388652	CLIENT_LOGIN_ERROR	\N
c9a1dd2c-1376-48ae-9159-df3b04cf07d5	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499388704	CLIENT_LOGIN_ERROR	\N
bcf29342-1083-4299-a938-c174775f82dd	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499388873	CLIENT_LOGIN_ERROR	\N
4874ffc4-f78a-45fc-b9db-b13844af81f1	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499388910	CLIENT_LOGIN_ERROR	\N
703396b6-d5de-4716-b7f4-9a0e91d95d21	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499388996	CLIENT_LOGIN_ERROR	\N
6e1fe093-b71f-464a-acfe-7d7a4064fae7	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499389032	CLIENT_LOGIN_ERROR	\N
0824c0fa-1be1-47f7-a316-40cb2d0384ef	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499389179	CLIENT_LOGIN_ERROR	\N
8a221e8c-5ced-4d40-ae70-c394259136c9	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499389216	CLIENT_LOGIN_ERROR	\N
9e5b0f6a-6b5d-4828-ac57-a05d7c10a02a	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499389320	CLIENT_LOGIN_ERROR	\N
4ca99ca8-de7e-4cf9-86f9-157ac7aa7195	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499389378	CLIENT_LOGIN_ERROR	\N
a9ff554e-c016-4d2f-89e7-cfea64646c31	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499389523	CLIENT_LOGIN_ERROR	\N
ed455fd5-d07c-4702-8fed-87ca0bf39c8b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499389567	CLIENT_LOGIN_ERROR	\N
b1261513-f692-4ae0-8bf4-de7a21dd6fb4	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499389664	CLIENT_LOGIN_ERROR	\N
891fd61b-1659-4a32-8ad2-20f42b223efa	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499389700	CLIENT_LOGIN_ERROR	\N
4c8b08ac-d50c-459a-a404-c5a0ed5397ee	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499389848	CLIENT_LOGIN_ERROR	\N
9ac07d98-7192-40f1-84cf-d2f0df0b615e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499389884	CLIENT_LOGIN_ERROR	\N
4ce93be0-2233-45cc-bf5c-534c8c4452bf	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499389979	CLIENT_LOGIN_ERROR	\N
cd3da1a3-6670-4214-83e5-78cb4c4e54bb	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499390034	CLIENT_LOGIN_ERROR	\N
bb7541e9-26c6-4381-b47b-1dfac71d27d6	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499390181	CLIENT_LOGIN_ERROR	\N
6a379e5b-a089-4172-866e-b7dec260b601	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499390223	CLIENT_LOGIN_ERROR	\N
36bc8813-afc7-4eb6-b86b-1809713cc0b0	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499390319	CLIENT_LOGIN_ERROR	\N
a1c3b637-4597-4ed0-9add-1779dcfa9ea9	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499390379	CLIENT_LOGIN_ERROR	\N
c7991ffa-d27a-4d20-b68e-cd532c08805a	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499390536	CLIENT_LOGIN_ERROR	\N
e495dd57-741e-41b0-a6af-1494174cf4e1	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499390579	CLIENT_LOGIN_ERROR	\N
52112b87-7df8-4f45-8e84-c95fc436d076	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499390665	CLIENT_LOGIN_ERROR	\N
5a3332e8-f9fb-4a0c-959b-70f1f5c5a037	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499390710	CLIENT_LOGIN_ERROR	\N
2ea1a402-4ed9-4453-b351-31fe0a43491c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499390859	CLIENT_LOGIN_ERROR	\N
aa2bd9ab-610f-4721-8f58-7853aab00dc8	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499390894	CLIENT_LOGIN_ERROR	\N
cde4bb74-1816-442c-8525-1426eed6bb06	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499390981	CLIENT_LOGIN_ERROR	\N
07b4a2cf-937d-416e-802b-089ba3e4bdc8	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499391033	CLIENT_LOGIN_ERROR	\N
2393e249-c093-4d13-8665-625c0401e5a0	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499391201	CLIENT_LOGIN_ERROR	\N
910e7437-16b1-4ecb-a733-e7e6ddd68de5	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499391293	CLIENT_LOGIN_ERROR	\N
be18c588-3455-4915-a22e-312905958470	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499391381	CLIENT_LOGIN_ERROR	\N
ded0e730-2e0e-4469-af1a-08acce29ec90	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499391422	CLIENT_LOGIN_ERROR	\N
49b9fff1-0435-40d3-93b6-338c3a6c826d	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499391573	CLIENT_LOGIN_ERROR	\N
85966bc3-68fd-4c41-b535-81592ea0f671	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499391630	CLIENT_LOGIN_ERROR	\N
7822a6a8-241a-468a-b0bf-08fc68e57215	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499391717	CLIENT_LOGIN_ERROR	\N
fa2e7463-2dc2-41e4-9b8e-d3272f2f8f46	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499391754	CLIENT_LOGIN_ERROR	\N
7ad75af9-66b4-489f-a625-205bb4a77139	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499391908	CLIENT_LOGIN_ERROR	\N
aead15d7-322a-4d8f-bf4c-cbbcca275a89	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499391946	CLIENT_LOGIN_ERROR	\N
3c1fc1bb-3c2a-40f5-acb0-4d5a9a4342d8	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499392029	CLIENT_LOGIN_ERROR	\N
9a83a8df-b1a9-4fc4-9d02-0eb96287b4c3	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499392068	CLIENT_LOGIN_ERROR	\N
b92445ca-e9a2-4e4f-a9f6-67149cb6903f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499392217	CLIENT_LOGIN_ERROR	\N
4af8832e-19a3-40f4-a6ca-a90d802b61be	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499392254	CLIENT_LOGIN_ERROR	\N
dda8b311-475b-4347-abba-c5348f6b5d11	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499392343	CLIENT_LOGIN_ERROR	\N
b9ad4860-2a5d-45c9-a9ea-3e1168d86d39	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499392391	CLIENT_LOGIN_ERROR	\N
62c4b8f6-62c6-4b2e-8fd5-f4aed14ef258	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499392561	CLIENT_LOGIN_ERROR	\N
fcfcb392-3b2f-464f-82ed-6b75b4f0b3e7	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499392614	CLIENT_LOGIN_ERROR	\N
adc1e887-f2d9-4a3f-8750-3405f14c638d	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499392706	CLIENT_LOGIN_ERROR	\N
1d8267ce-3121-4df1-864d-03a890989ddb	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499392822	CLIENT_LOGIN_ERROR	\N
7424dafb-eb48-4a34-81ec-6fb0e8c32169	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499392912	CLIENT_LOGIN_ERROR	\N
74e5cf3e-0da1-4fc1-8565-f34bd2b14c3b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499392950	CLIENT_LOGIN_ERROR	\N
6f5070d7-dff5-4eba-99d3-4c80a09f8ca7	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499393039	CLIENT_LOGIN_ERROR	\N
947e7310-65fb-4662-ab87-77b4b59d276b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499393148	CLIENT_LOGIN_ERROR	\N
fc29c8d7-a73f-4fbc-b977-d1e5ed2408e4	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499393250	CLIENT_LOGIN_ERROR	\N
bba4f1d8-e173-418a-b25e-b5642bc00b49	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499393286	CLIENT_LOGIN_ERROR	\N
519f7b6e-2633-4914-8dfb-c416e572f3b7	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499393378	CLIENT_LOGIN_ERROR	\N
b81d0092-6e3a-4dc4-80cb-90d966d0c4d6	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499393514	CLIENT_LOGIN_ERROR	\N
25ab8af0-1cc0-44f9-a5a1-72f53e9fe1d5	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499393599	CLIENT_LOGIN_ERROR	\N
f1d7358e-920c-4c57-add0-0dfefad4a411	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499393637	CLIENT_LOGIN_ERROR	\N
a453f2b1-1611-4d24-98d4-ac709e02df0b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499393726	CLIENT_LOGIN_ERROR	\N
fc4b1a5e-eda5-4c79-9e81-14efb2cadc14	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499393852	CLIENT_LOGIN_ERROR	\N
08e270be-97ae-4ef8-8966-082ca7121660	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499393969	CLIENT_LOGIN_ERROR	\N
97d88780-9f91-46bf-abe9-a136ece39d0f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499394017	CLIENT_LOGIN_ERROR	\N
7e34a3de-71b3-4e29-844a-81557440c8ae	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499394101	CLIENT_LOGIN_ERROR	\N
df9a4e8a-f121-4fa1-876a-71e728e694e0	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499394228	CLIENT_LOGIN_ERROR	\N
4c38ad70-4222-44dc-af19-b5c01b45ae73	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499394337	CLIENT_LOGIN_ERROR	\N
735b28e4-89ec-491f-9c46-fd5f3eb64d46	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499394373	CLIENT_LOGIN_ERROR	\N
26498d6a-e158-476f-97da-88ef1ba9eea4	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499394465	CLIENT_LOGIN_ERROR	\N
41dd8592-a8e6-439d-b4a0-cf218dd13a75	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499394575	CLIENT_LOGIN_ERROR	\N
39e8ed35-468b-4e3d-bfbb-4990ee10cc0e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499394672	CLIENT_LOGIN_ERROR	\N
f22bff7f-370a-43e3-90d1-d3f4226c9129	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499394724	CLIENT_LOGIN_ERROR	\N
1498e882-7396-4db6-ba45-f1d115bf4e14	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499394818	CLIENT_LOGIN_ERROR	\N
9ce4fac8-2dfb-4b05-bf48-fcfde7ae098f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499394925	CLIENT_LOGIN_ERROR	\N
afbbcbf7-2e8c-4ab7-af80-d95c1bf6adfb	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499395015	CLIENT_LOGIN_ERROR	\N
82a3f2ea-bc72-4adf-8579-1852956a91dc	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499395064	CLIENT_LOGIN_ERROR	\N
5a5e56d6-8c0f-440e-bde3-82189fda5823	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499395155	CLIENT_LOGIN_ERROR	\N
40375579-4452-43a0-a140-2064473d6cb8	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499395258	CLIENT_LOGIN_ERROR	\N
2d661c04-4f9a-4d7d-896c-d922cd641ace	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499395343	CLIENT_LOGIN_ERROR	\N
72c404a3-c174-42e2-b265-44f354d88543	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499395380	CLIENT_LOGIN_ERROR	\N
ba179280-1490-4d02-86ef-1c69fb331b80	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499395467	CLIENT_LOGIN_ERROR	\N
0f4c193d-1bb0-4b05-84a2-fe1b562fb3b9	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499395570	CLIENT_LOGIN_ERROR	\N
31c9b61a-3380-4ce9-9ddc-7473fa27d61c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499395654	CLIENT_LOGIN_ERROR	\N
885bab1c-fa18-4145-8e63-bcd9a6a57953	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499395692	CLIENT_LOGIN_ERROR	\N
5c5f68d4-086c-484d-8f9d-37bffb431441	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499395777	CLIENT_LOGIN_ERROR	\N
5e74c456-b24b-4323-ae2b-527e3b152c1e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499395877	CLIENT_LOGIN_ERROR	\N
88ef25a3-3bae-46ac-8264-7a05a2d243f8	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499395970	CLIENT_LOGIN_ERROR	\N
f787b596-4f02-4bee-a244-9597bcab6107	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499396009	CLIENT_LOGIN_ERROR	\N
8bf886e3-3bc7-462a-b455-cc952c59b86b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499396089	CLIENT_LOGIN_ERROR	\N
a950b176-a65d-44b5-b303-f09d9f3f8601	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499396193	CLIENT_LOGIN_ERROR	\N
d79efde6-555d-434c-be07-6f49b9649c89	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499396276	CLIENT_LOGIN_ERROR	\N
d75ad3dd-3c0a-4b93-9981-5cb3f77079ff	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499396313	CLIENT_LOGIN_ERROR	\N
50dddb91-f7f2-494b-b1e3-47e67484cda5	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499396396	CLIENT_LOGIN_ERROR	\N
2dd85844-f12d-4c30-912b-16dc28536398	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499396500	CLIENT_LOGIN_ERROR	\N
32edadc9-4662-4992-a4ed-abfc2f86e102	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499396586	CLIENT_LOGIN_ERROR	\N
4625a2bb-31ca-4fc1-bb21-d2490ce1bcf7	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499396638	CLIENT_LOGIN_ERROR	\N
b25a8b5e-8376-446a-ae1e-bcc5efa6fbb7	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499396731	CLIENT_LOGIN_ERROR	\N
0e12f7b8-3cd9-43c6-9fcb-028c2bb8e70e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499396737	CLIENT_LOGIN_ERROR	\N
49082303-0804-4585-8c2e-ac7b90b1ae8f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499396871	CLIENT_LOGIN_ERROR	\N
66a61707-dfff-4e94-9190-fd5d2c4200bc	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499397019	CLIENT_LOGIN_ERROR	\N
a75565c7-f03c-4e43-b63c-17978d20de82	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499397047	CLIENT_LOGIN_ERROR	\N
f021b630-07e5-453e-8739-7aef90227b0a	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499397261	CLIENT_LOGIN_ERROR	\N
c7dbc432-4c1c-4e6a-b5ab-01416e5c3872	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499397274	CLIENT_LOGIN_ERROR	\N
c90b5ad6-8bfc-4acf-b2f4-2b9434631cb3	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499397363	CLIENT_LOGIN_ERROR	\N
47283369-b1b1-43cf-8ae2-de1ed4e477cb	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499397397	CLIENT_LOGIN_ERROR	\N
12b79ee7-52fc-451e-a72f-275877981aa1	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499397493	CLIENT_LOGIN_ERROR	\N
d8cbc7cd-2df5-4317-bd4b-fd16c0ea3688	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499397507	CLIENT_LOGIN_ERROR	\N
6f114192-5bb7-4e99-bf66-4dc58f1208ce	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499397671	CLIENT_LOGIN_ERROR	\N
957df434-4828-44a4-a1a1-16b80a6be178	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499397686	CLIENT_LOGIN_ERROR	\N
e4574742-4d58-45e2-875d-09f82f27cef4	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499397809	CLIENT_LOGIN_ERROR	\N
fb6bdf7e-483d-47ac-bf81-ea9c6109d85e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499397815	CLIENT_LOGIN_ERROR	\N
e755f4ee-bd34-4859-94ab-18be9888c293	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499397883	CLIENT_LOGIN_ERROR	\N
9ff5f201-c8d4-4859-bc5a-50511060dd2e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499398039	CLIENT_LOGIN_ERROR	\N
427f16e7-0093-41e3-b6c8-9119cf4776d8	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499398045	CLIENT_LOGIN_ERROR	\N
a4f1b3c6-ff3c-4dc8-b3e3-54efa2a554ea	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499398111	CLIENT_LOGIN_ERROR	\N
ee448f0f-5be6-456a-8d02-53272cd9d337	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499398273	CLIENT_LOGIN_ERROR	\N
99d06ce1-486f-4756-81c7-c598d9dccbe0	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499398289	CLIENT_LOGIN_ERROR	\N
11cd4c29-954a-4068-85d8-38d7c96da442	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499398351	CLIENT_LOGIN_ERROR	\N
8637c278-970a-4cf9-b817-573c36172509	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499398437	CLIENT_LOGIN_ERROR	\N
ebf772a8-9f4d-4740-9082-4ff641d07a24	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499398454	CLIENT_LOGIN_ERROR	\N
790bb21e-a71b-4f1f-b10e-48b73b8025b3	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499398584	CLIENT_LOGIN_ERROR	\N
42efd179-ac9c-4a0a-9586-d58270d1a34a	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499398693	CLIENT_LOGIN_ERROR	\N
55fc288f-bf1f-4601-b72d-7ffa87ae6d69	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499398698	CLIENT_LOGIN_ERROR	\N
cdc84822-5f48-4cb6-b442-e986bf9437c9	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499398766	CLIENT_LOGIN_ERROR	\N
1fe90dfd-490c-41dd-b5a2-cc44aa2cb530	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499398915	CLIENT_LOGIN_ERROR	\N
11336395-0816-40ca-bd5b-75852ed5d4a4	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499398921	CLIENT_LOGIN_ERROR	\N
f7dc064b-eb0e-4302-9293-4174c226b3c2	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499398986	CLIENT_LOGIN_ERROR	\N
c50b4370-fdd3-45c2-84d7-2f2de209f323	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499399071	CLIENT_LOGIN_ERROR	\N
23b862ea-06a2-4126-98ee-1378a68ecc7d	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499399077	CLIENT_LOGIN_ERROR	\N
33446409-7250-47eb-8715-f4e5aba42290	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499399203	CLIENT_LOGIN_ERROR	\N
0ddd4f36-cd0e-4152-b2e0-9a666baf7490	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499399288	CLIENT_LOGIN_ERROR	\N
68a00cd6-04cf-406e-b246-64d47029e984	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499399295	CLIENT_LOGIN_ERROR	\N
bb6a007c-d08f-485f-9b51-904439a9227b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499399430	CLIENT_LOGIN_ERROR	\N
95c73dd4-583f-443d-af8d-c3eb2c37c2e9	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499399515	CLIENT_LOGIN_ERROR	\N
2cd790ba-df96-4f66-bbfd-c14b6a3e9fbf	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499399521	CLIENT_LOGIN_ERROR	\N
3f9d3803-957d-4c2d-81e1-b35adf3d91fe	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499399535	CLIENT_LOGIN_ERROR	\N
28d9ded2-f1eb-44b6-8820-4cd7c5cc0775	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499399620	CLIENT_LOGIN_ERROR	\N
f539df67-bd28-4600-9cc1-a3da9ee6cd46	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499399627	CLIENT_LOGIN_ERROR	\N
a144416d-b3c9-49f2-9e91-6fc9bf266ad3	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499399763	CLIENT_LOGIN_ERROR	\N
6ff099c0-6363-4e23-8de2-5a5951cbd1a9	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499399849	CLIENT_LOGIN_ERROR	\N
93b75026-29a7-475f-a90f-a6e6b3654de8	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499399856	CLIENT_LOGIN_ERROR	\N
bb966440-7744-451e-8dd2-156f3563df98	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499399905	CLIENT_LOGIN_ERROR	\N
d0c6bf8b-bf6c-45d5-a36c-26881864ecfa	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499400076	CLIENT_LOGIN_ERROR	\N
ceb59a1e-595f-4ad3-a947-c842babe2e48	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499400084	CLIENT_LOGIN_ERROR	\N
25e9654a-2002-4085-9f99-aa453d64040c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499400149	CLIENT_LOGIN_ERROR	\N
a20f6f3e-8804-4253-850b-d17085e4f002	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499400325	CLIENT_LOGIN_ERROR	\N
d8374e9d-990c-4e26-b933-cbd0b972a6e2	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499400346	CLIENT_LOGIN_ERROR	\N
1c11fec8-0f52-4253-8126-2c4420b07142	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499400418	CLIENT_LOGIN_ERROR	\N
3d83019a-9439-4bee-a3d8-fbe960d9f5bf	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499400505	CLIENT_LOGIN_ERROR	\N
42996dd9-52de-49e3-84a2-488ca2e279c5	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499400511	CLIENT_LOGIN_ERROR	\N
d246d276-7e87-4155-8e7d-7df1ff1fb91c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499400646	CLIENT_LOGIN_ERROR	\N
5283d7bc-dd37-48f7-9f69-ca023ffa0df7	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499400729	CLIENT_LOGIN_ERROR	\N
4e6dc6ab-1a2d-4be3-be34-dae4963695d9	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499400735	CLIENT_LOGIN_ERROR	\N
09865d55-9cd9-47cc-9ac1-95d17ff281f1	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499400750	CLIENT_LOGIN_ERROR	\N
5c1993c1-35ae-474a-84ac-7a1a7ff9fe51	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499400836	CLIENT_LOGIN_ERROR	\N
067a875b-afa8-4351-a753-c2de99fa4a79	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499400856	CLIENT_LOGIN_ERROR	\N
bd691c55-7da8-459a-9ac7-45da3309c5ac	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499400983	CLIENT_LOGIN_ERROR	\N
e59c71c9-3022-408a-9b00-9a9d1eb30c9f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499401068	CLIENT_LOGIN_ERROR	\N
61b42949-a559-42f6-8bc1-f866e99fc9ee	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499401074	CLIENT_LOGIN_ERROR	\N
dbfa559e-90a9-45e5-b123-547471b65695	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499401089	CLIENT_LOGIN_ERROR	\N
bbab7945-c5db-42e7-ab9a-5b5321b5a8e1	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499401177	CLIENT_LOGIN_ERROR	\N
c2c81ad1-4553-41be-9365-dc7d10850afa	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499401194	CLIENT_LOGIN_ERROR	\N
d4e7c390-efeb-4d11-9b92-3721ec4a26e4	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499401327	CLIENT_LOGIN_ERROR	\N
6dd9988d-64da-4173-bdc6-36e3efa6bbe1	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499401412	CLIENT_LOGIN_ERROR	\N
6ae183e9-7445-4ab3-a92e-414d588eca10	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499401418	CLIENT_LOGIN_ERROR	\N
f3157b57-fbfd-4016-b9bc-8c9b2a4bc961	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499401432	CLIENT_LOGIN_ERROR	\N
9864f5e0-2c0b-486f-8ba9-0d95e2b2ca4f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499401585	CLIENT_LOGIN_ERROR	\N
6026128e-f138-4fec-b155-b90d49d036ae	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499401594	CLIENT_LOGIN_ERROR	\N
95ab5c54-4d14-443a-a49b-9d47ff7f0557	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499401669	CLIENT_LOGIN_ERROR	\N
d90baa51-0d13-4ab9-85b4-bf5123902ab0	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499401759	CLIENT_LOGIN_ERROR	\N
4b34e684-b8eb-4946-a73f-1545cdd86539	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499401776	CLIENT_LOGIN_ERROR	\N
8302a9c6-149d-48a0-9107-9c3791367936	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499401953	CLIENT_LOGIN_ERROR	\N
68e08309-6257-4843-9f71-d9c0cf8fd570	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499401962	CLIENT_LOGIN_ERROR	\N
1bbafc62-16ec-42fb-a65f-e67353c24157	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499402037	CLIENT_LOGIN_ERROR	\N
69536d22-4260-41af-8b13-501a2c685c4e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499402130	CLIENT_LOGIN_ERROR	\N
24e51cdc-8b99-478f-8841-56c2d1890871	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499402236	CLIENT_LOGIN_ERROR	\N
cc8973db-d0a9-4075-8e39-86ffe319d8d6	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499402321	CLIENT_LOGIN_ERROR	\N
9a279a23-aefb-4c49-98e3-cd9f4b1036e9	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499402359	CLIENT_LOGIN_ERROR	\N
da34caec-b612-4d9b-9280-93eda75ff211	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499402443	CLIENT_LOGIN_ERROR	\N
0ef7a5aa-49fc-4dee-a828-fab5c9330824	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499402542	CLIENT_LOGIN_ERROR	\N
ba3f3e6c-633d-4de9-a8db-bdc72f436d79	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499402630	CLIENT_LOGIN_ERROR	\N
bdc8ce0d-1e77-449f-bd32-5489c357516c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499402666	CLIENT_LOGIN_ERROR	\N
19e323d7-0090-43ff-9400-0f34d3606f6e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499402747	CLIENT_LOGIN_ERROR	\N
1d697874-96bf-45b5-aa45-84040a671f2c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499402853	CLIENT_LOGIN_ERROR	\N
ad584fd9-3de0-4b04-a207-34d3fceeccea	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499402937	CLIENT_LOGIN_ERROR	\N
3505e689-b956-4bcf-a994-6786e05f2310	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499402973	CLIENT_LOGIN_ERROR	\N
c00a9014-a25e-49c9-8d5f-a670677ccac5	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499403059	CLIENT_LOGIN_ERROR	\N
9ce6ceb9-92ca-4940-85aa-36cfdf45775f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499403163	CLIENT_LOGIN_ERROR	\N
dcd65a4c-cf21-4dc6-b856-9c3ca1436c5a	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499403245	CLIENT_LOGIN_ERROR	\N
bf800275-7a48-4ecc-96a9-c169c84c533b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499403293	CLIENT_LOGIN_ERROR	\N
d52938fa-63f2-4884-ace4-84da51b3e1ec	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499403380	CLIENT_LOGIN_ERROR	\N
0bd77c50-2771-4c5d-866c-86e9af1db706	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499403481	CLIENT_LOGIN_ERROR	\N
96599796-f225-4c3d-85ab-9454b38ec82e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499403569	CLIENT_LOGIN_ERROR	\N
905a8893-fabd-48c9-a92f-fd6b7d780563	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499403607	CLIENT_LOGIN_ERROR	\N
f914767e-4e8c-44ef-9c63-64ab66b9e788	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499403767	CLIENT_LOGIN_ERROR	\N
2940ea51-ae54-47ff-9b52-bd810b72f84e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499403815	CLIENT_LOGIN_ERROR	\N
2eab76d1-a5a1-4b99-9787-975c8b7f68dc	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499403906	CLIENT_LOGIN_ERROR	\N
b7623bc6-b011-4604-8f99-523d41f530f5	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499403964	CLIENT_LOGIN_ERROR	\N
304d3502-6c36-4438-b12a-65fe0eb56c3d	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499404170	CLIENT_LOGIN_ERROR	\N
c04d62f0-34ef-4058-ae4f-2da922511e09	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499404210	CLIENT_LOGIN_ERROR	\N
cd07de6b-1a48-4873-aa72-569b2f2601cb	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499404302	CLIENT_LOGIN_ERROR	\N
4431b19f-962c-4d6b-b436-2d740b842c6f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499404354	CLIENT_LOGIN_ERROR	\N
cb33b489-a3ce-499d-a938-fcdfb9bffd73	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499404531	CLIENT_LOGIN_ERROR	\N
d2325b9e-83ef-4271-9538-cc725262f383	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499404570	CLIENT_LOGIN_ERROR	\N
d6e45397-0ab1-4d0b-9fb0-95d0c78f4a6e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499404663	CLIENT_LOGIN_ERROR	\N
4f409539-dc27-4007-9627-7efde22bc98d	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499404703	CLIENT_LOGIN_ERROR	\N
6ce08c31-67be-4832-8211-bac112e3320a	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499404883	CLIENT_LOGIN_ERROR	\N
586885b2-fa41-4c0d-9bf1-c57cf7624f57	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499404921	CLIENT_LOGIN_ERROR	\N
0a87fe92-db2a-4f4e-8bc5-72c3161e1af0	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499405010	CLIENT_LOGIN_ERROR	\N
35ffda00-fe23-4d76-87f9-99a38cad9c3c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499405046	CLIENT_LOGIN_ERROR	\N
23ca0ac5-6282-483d-b82f-ac80278b5ce2	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499405213	CLIENT_LOGIN_ERROR	\N
7555cfd7-afc1-47fa-9559-cc4318955a8f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499405259	CLIENT_LOGIN_ERROR	\N
6644444b-10cb-4d14-a4b1-bcc7d838d250	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499405349	CLIENT_LOGIN_ERROR	\N
5fd910f1-f7b8-42b8-a726-4fefac2e32c8	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499405389	CLIENT_LOGIN_ERROR	\N
907b1770-dd2b-4477-8059-3f81f718148c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499405572	CLIENT_LOGIN_ERROR	\N
bca6e1a5-576e-4b98-9402-c2db50ddacee	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499405611	CLIENT_LOGIN_ERROR	\N
25826ba2-a385-4f1d-82a8-4c0845cd3007	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499405705	CLIENT_LOGIN_ERROR	\N
8c15a93d-2022-4d98-85c8-47ea62fdcca6	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499405763	CLIENT_LOGIN_ERROR	\N
1a9b8256-d205-476d-8438-d246a3118698	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499405927	CLIENT_LOGIN_ERROR	\N
29191602-f3e1-4f73-a53f-5bcb79a8291e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499405965	CLIENT_LOGIN_ERROR	\N
2d32a7c7-c03c-4e2f-9490-95797dec5c82	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499406052	CLIENT_LOGIN_ERROR	\N
eaefab7b-57ab-4910-b080-b4a5517e53cc	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499406089	CLIENT_LOGIN_ERROR	\N
f6defa07-5323-4959-8345-aea44d4ca462	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499406252	CLIENT_LOGIN_ERROR	\N
70eabc2d-1d92-4102-bfc7-e530d80bbf96	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499406290	CLIENT_LOGIN_ERROR	\N
a283c639-8393-426a-a688-c379cf02efdd	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499406382	CLIENT_LOGIN_ERROR	\N
6d3d263f-5c75-4684-acac-cb506d19aa8b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499406421	CLIENT_LOGIN_ERROR	\N
db216f86-66da-40be-8d32-97c6ff4bde72	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499406587	CLIENT_LOGIN_ERROR	\N
9f18cd11-19cf-417e-b96c-aa1b09ca8bfb	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499406623	CLIENT_LOGIN_ERROR	\N
1c6622cd-c0bb-4a30-9e59-48df846e8209	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499406714	CLIENT_LOGIN_ERROR	\N
467a2b64-9e34-4538-9546-dbb462cc4567	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499406772	CLIENT_LOGIN_ERROR	\N
746d334b-1b32-4760-b303-cec243abfe31	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499406944	CLIENT_LOGIN_ERROR	\N
ed2b5e88-7162-49ed-b999-2d9337389d84	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499406981	CLIENT_LOGIN_ERROR	\N
0457d2f7-28ab-4705-afbd-766bc87e1bbf	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499407100	CLIENT_LOGIN_ERROR	\N
eb0456b3-6523-4f67-ac76-b8ae9033d881	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499407138	CLIENT_LOGIN_ERROR	\N
ea79c4d6-6c56-415b-8cf7-9ae19c73b4b7	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499407310	CLIENT_LOGIN_ERROR	\N
b01486e6-b363-4ecf-8ea0-a5db1ab1552e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499407349	CLIENT_LOGIN_ERROR	\N
eab93607-df21-4de2-a55b-3d97700292f0	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499407437	CLIENT_LOGIN_ERROR	\N
97cbf5af-a49a-45f7-987a-27d4081bceef	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499407476	CLIENT_LOGIN_ERROR	\N
a21d3877-3624-4714-8261-99c40da76dbd	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499407636	CLIENT_LOGIN_ERROR	\N
bda2cc70-821c-45e5-83c3-24d0a4c7a59e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499407673	CLIENT_LOGIN_ERROR	\N
0e816d27-4534-4c35-bd27-fb3135895ce1	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499407758	CLIENT_LOGIN_ERROR	\N
7c53ed4a-80e2-41a3-a70f-3e962d90e728	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499407793	CLIENT_LOGIN_ERROR	\N
460b27aa-9d35-475b-80f2-f25d233996a5	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499407878	CLIENT_LOGIN_ERROR	\N
945dcdfc-f9fb-4f63-bf77-c731231e22db	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499407997	CLIENT_LOGIN_ERROR	\N
2b53f86b-3a08-429b-ba36-90804fd83c9c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499408091	CLIENT_LOGIN_ERROR	\N
249f3dbc-c5de-41dc-bba6-4ef252c2dc61	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499408150	CLIENT_LOGIN_ERROR	\N
59923405-f790-48a2-8b6b-c8ecb29d522b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499408242	CLIENT_LOGIN_ERROR	\N
81e03c6a-defb-4bef-9778-ef9c7f084322	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499408343	CLIENT_LOGIN_ERROR	\N
74d5ead7-8bcf-46f2-af37-04a2f14773b9	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499408427	CLIENT_LOGIN_ERROR	\N
23060973-9c7e-4a3c-920f-3c5c6e75444d	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499408462	CLIENT_LOGIN_ERROR	\N
2796dcdd-4ace-435b-9e4c-dec402184b65	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499408549	CLIENT_LOGIN_ERROR	\N
da0a5c35-7276-452f-86a3-5d98f6c32d24	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499408655	CLIENT_LOGIN_ERROR	\N
eddbe07b-962c-4970-b27e-0133452d8cef	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499408743	CLIENT_LOGIN_ERROR	\N
4d761a38-1a93-4841-bda7-89bb0f133ad5	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499408781	CLIENT_LOGIN_ERROR	\N
c16fba15-7bcb-49f1-bad2-07ebcc6a3d37	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499408867	CLIENT_LOGIN_ERROR	\N
c7e64930-4529-47ee-9a21-a6ef9eaeaf94	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499408969	CLIENT_LOGIN_ERROR	\N
41ac3394-542d-4372-a499-3a103b46121a	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499409053	CLIENT_LOGIN_ERROR	\N
2b85ef11-19b1-42de-b736-cb82bc2f397b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499409098	CLIENT_LOGIN_ERROR	\N
36ca487f-b3e9-4c8b-8f64-e1912298a022	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499409183	CLIENT_LOGIN_ERROR	\N
ffff8b7c-de64-4af9-b4d7-359925cc8447	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499409283	CLIENT_LOGIN_ERROR	\N
781c34ac-ae20-45cc-9e5e-7c100b340496	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499409368	CLIENT_LOGIN_ERROR	\N
5adbaa0f-0fd0-4005-ae81-7366897822fe	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499409404	CLIENT_LOGIN_ERROR	\N
02dafbb4-db41-4e52-9b3d-99e4aad11f5f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499409587	CLIENT_LOGIN_ERROR	\N
24b047a0-458d-40c5-83c8-da4992f0dec2	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499409677	CLIENT_LOGIN_ERROR	\N
cfd43997-7ee3-456c-a12c-58bcb62f8052	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499409844	CLIENT_LOGIN_ERROR	\N
1e618386-9350-4665-b55c-539dc9eb24be	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499409923	CLIENT_LOGIN_ERROR	\N
9d85a33e-8321-4a13-8ff1-6fd8d41ef625	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499410145	CLIENT_LOGIN_ERROR	\N
2a2ce0e0-f054-4762-adcd-35dc2c8e710e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499410196	CLIENT_LOGIN_ERROR	\N
6fc2d632-4a41-4e78-8699-d280e5af2a37	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499410299	CLIENT_LOGIN_ERROR	\N
ecac6e63-4d26-435c-ae25-0caf0fbb4b64	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499410340	CLIENT_LOGIN_ERROR	\N
7c6eb95e-829e-4e0b-9e7d-39bdabc1798e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499410428	CLIENT_LOGIN_ERROR	\N
70708473-e708-4c99-9d45-2528d2f7ec70	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499410535	CLIENT_LOGIN_ERROR	\N
0ef9f6e9-52bb-44e7-ac7d-d8dcd4e6c849	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499410625	CLIENT_LOGIN_ERROR	\N
e5f7fad6-3ce8-4194-8d36-0afff9a925b1	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499410672	CLIENT_LOGIN_ERROR	\N
728eb537-99f3-423d-923e-c4251ab9f9a6	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499410759	CLIENT_LOGIN_ERROR	\N
514c5185-6769-459d-86b6-35193faac1e7	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499410890	CLIENT_LOGIN_ERROR	\N
0b240777-3540-4231-9808-8a352149220c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499410984	CLIENT_LOGIN_ERROR	\N
dc3dbc10-4bce-48de-97fe-7f9fa6afa622	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499411021	CLIENT_LOGIN_ERROR	\N
8fb5bc44-da29-4327-8367-4f4c958931e1	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499411114	CLIENT_LOGIN_ERROR	\N
5b1ce577-b365-47f3-ac6d-b386736677d2	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499411251	CLIENT_LOGIN_ERROR	\N
93f823a9-b291-4a77-9953-76c289803ff6	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499411347	CLIENT_LOGIN_ERROR	\N
f5f99dd9-eadf-40b2-b062-835e58c53822	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499411401	CLIENT_LOGIN_ERROR	\N
72e96baf-8e6d-491d-bc76-5b73a6ce73e4	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499411496	CLIENT_LOGIN_ERROR	\N
df91f77e-9eb2-484d-9fb4-22b4190cef34	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499411626	CLIENT_LOGIN_ERROR	\N
9a952175-8978-44ed-b566-9566ad9df793	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499411716	CLIENT_LOGIN_ERROR	\N
e8e60bd4-11fa-445a-bd30-da631aaa5a08	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499411755	CLIENT_LOGIN_ERROR	\N
e0599ca1-e5eb-4fb4-8c5d-876e2d1fba29	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499411847	CLIENT_LOGIN_ERROR	\N
1343be63-4e92-40e0-b5a3-00f494caf073	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499411964	CLIENT_LOGIN_ERROR	\N
022b40ef-82eb-402d-8ca8-c9d959413742	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499412049	CLIENT_LOGIN_ERROR	\N
398441c7-6f99-4e85-9412-cd52771bb988	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499412087	CLIENT_LOGIN_ERROR	\N
1cd069bb-c8ff-40a5-bf9f-7e611e0ff2e2	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499412175	CLIENT_LOGIN_ERROR	\N
7b6ad5f4-ad6a-434f-a612-27c45a62fc4e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499412283	CLIENT_LOGIN_ERROR	\N
1ad4c5f0-f760-4c77-ad75-dae6ac0d65ef	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499412366	CLIENT_LOGIN_ERROR	\N
b049d8b0-9b8b-4014-8a48-896c0966c22c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499412401	CLIENT_LOGIN_ERROR	\N
c0a3fc86-7981-4c99-b5f4-f9244e8aa485	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499412485	CLIENT_LOGIN_ERROR	\N
bca03852-28d2-40a8-8b49-46cc7e7b4d3e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499412587	CLIENT_LOGIN_ERROR	\N
aad966e1-5650-441d-af65-46d17153cf11	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499412674	CLIENT_LOGIN_ERROR	\N
333f2834-f060-4d64-8dbb-2c6626521ba1	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499412734	CLIENT_LOGIN_ERROR	\N
6cd5cce5-56e1-4800-a386-c7a0ecb081da	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499412821	CLIENT_LOGIN_ERROR	\N
7c9e3d04-082a-4dcc-9564-f4d170f889a6	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499412933	CLIENT_LOGIN_ERROR	\N
1fefa68e-5dbb-487a-bae1-9984f1c00a6b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499413018	CLIENT_LOGIN_ERROR	\N
38499dd9-efda-47b4-9139-55bad7e4d0df	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499413065	CLIENT_LOGIN_ERROR	\N
41d17db7-8047-445a-8112-fd25f2935c43	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499413148	CLIENT_LOGIN_ERROR	\N
e9edf52c-8c55-49c4-91c8-74a3ef622878	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499413259	CLIENT_LOGIN_ERROR	\N
cd63b145-f87b-4cc0-bbea-a7796fd6cbcc	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499413345	CLIENT_LOGIN_ERROR	\N
e1e69445-0647-4b64-acf6-5b1d1598b420	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499413385	CLIENT_LOGIN_ERROR	\N
daf28e9b-0b10-4f78-891e-7668e1172fd9	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499413471	CLIENT_LOGIN_ERROR	\N
9d18e945-9556-4420-9df8-5adabd6d5b87	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499413590	CLIENT_LOGIN_ERROR	\N
f1afaba9-0892-4617-9cb9-b6ceeb7b70a0	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499413674	CLIENT_LOGIN_ERROR	\N
202d4bc1-2d34-441d-b881-11d9aff0e2d6	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499413718	CLIENT_LOGIN_ERROR	\N
cd76251c-850b-4d85-a500-c7554a858c57	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499413813	CLIENT_LOGIN_ERROR	\N
c955e95a-784d-46f2-9971-aab4411b6375	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499413918	CLIENT_LOGIN_ERROR	\N
05395049-7dd3-48ea-bba3-a6c5e93f676f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499414005	CLIENT_LOGIN_ERROR	\N
41ce0434-0cf7-47f7-8054-d0f8c4749f71	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499414042	CLIENT_LOGIN_ERROR	\N
dd67aeee-1851-4e2d-b18e-47cbdcda1227	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499414224	CLIENT_LOGIN_ERROR	\N
df05c207-40e0-4e3e-8958-d3ff81525a3b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499414278	CLIENT_LOGIN_ERROR	\N
2ef85112-4e25-429e-aaf5-6479ab60e24e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499414368	CLIENT_LOGIN_ERROR	\N
86c9fbc3-7224-4442-a379-545afd15eb36	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499414421	CLIENT_LOGIN_ERROR	\N
c250c4f6-f457-4bd3-8e64-e881430d4fb0	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499414592	CLIENT_LOGIN_ERROR	\N
f1671bfc-ea84-47da-a326-821ded8d9178	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499414653	CLIENT_LOGIN_ERROR	\N
5a4e4f75-b47c-4602-bb45-b2797615adb8	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499414737	CLIENT_LOGIN_ERROR	\N
06baca05-61ef-4ebe-82c5-d2cb14ca8a0b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499414774	CLIENT_LOGIN_ERROR	\N
739467ad-96c1-45be-bb23-02cd2e5baa20	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499414862	CLIENT_LOGIN_ERROR	\N
6fe1b01d-2572-42bc-ab8b-f229dd107a1e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499414871	CLIENT_LOGIN_ERROR	\N
7f649e02-2b47-4545-af34-4f8aaed4eb7c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499415016	CLIENT_LOGIN_ERROR	\N
740288b3-2681-4302-862b-a634c5940593	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499415108	CLIENT_LOGIN_ERROR	\N
26c5d8b7-3a46-4af8-9927-669ee8359709	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499415137	CLIENT_LOGIN_ERROR	\N
0a1483b9-bea1-436c-99ac-5cc975a1936c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499415282	CLIENT_LOGIN_ERROR	\N
5b3adb89-9ccf-4113-8197-6c7c3ef691ec	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499415363	CLIENT_LOGIN_ERROR	\N
3821859b-db90-42b9-a8f3-39f1f086584b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499415373	CLIENT_LOGIN_ERROR	\N
327838aa-fb74-419b-91dc-8f2506c680b3	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499415445	CLIENT_LOGIN_ERROR	\N
884e9fbc-5b48-4eb4-b532-830d916639f8	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499415608	CLIENT_LOGIN_ERROR	\N
5b499dd5-6ecf-4a74-aa9d-0bc4579024f1	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499415619	CLIENT_LOGIN_ERROR	\N
f4f3fb4d-8e7a-4f79-95eb-97bf065e4f28	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499415692	CLIENT_LOGIN_ERROR	\N
e6dc2ea1-4815-42b4-b4a0-12ed812b2687	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499415775	CLIENT_LOGIN_ERROR	\N
6c5a8810-4b24-4079-835c-bd5e3b0c00c0	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499415785	CLIENT_LOGIN_ERROR	\N
56d0a179-f6d3-4473-941b-c6aa85b62167	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499415952	CLIENT_LOGIN_ERROR	\N
4d8661fc-e02b-416c-ac9a-4da93aa87402	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499416044	CLIENT_LOGIN_ERROR	\N
4b677117-e2bf-4142-bcc4-a57a30d7c4f9	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499416082	CLIENT_LOGIN_ERROR	\N
5ea00707-9300-4d6b-b3d4-c05847b00235	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499416305	CLIENT_LOGIN_ERROR	\N
637ad4a4-2958-4096-891f-51a22c93eab4	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499416355	CLIENT_LOGIN_ERROR	\N
73b9222f-3247-4fd3-ad86-06c919eb3bed	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499416472	CLIENT_LOGIN_ERROR	\N
3ac354da-3800-44ba-9089-dd66fca83b9e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499416511	CLIENT_LOGIN_ERROR	\N
28284566-8ca5-455b-9398-abf845ca4fa1	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499416686	CLIENT_LOGIN_ERROR	\N
c2e18f69-39fa-40a1-b998-5141759a2a66	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499416730	CLIENT_LOGIN_ERROR	\N
2cf4e1b3-6b44-4512-8530-3340c2935d16	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499416823	CLIENT_LOGIN_ERROR	\N
49bea3bd-1f68-48f1-9c44-c64c43b3c990	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499416863	CLIENT_LOGIN_ERROR	\N
08cdab5c-9649-4ebb-a07a-89f1653332bc	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499417033	CLIENT_LOGIN_ERROR	\N
f86c7d0f-d69a-464b-acbb-8d270f5e013f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499417069	CLIENT_LOGIN_ERROR	\N
008577ab-ab1a-4cac-8c9d-6526ef7c3959	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499417154	CLIENT_LOGIN_ERROR	\N
2802a837-d563-4146-b7e9-8a84544d3260	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499417190	CLIENT_LOGIN_ERROR	\N
2cf20d0c-b3ae-484a-8b2e-26c339524bb4	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499417359	CLIENT_LOGIN_ERROR	\N
c5ab8721-8ece-499e-a65a-2820b64be4de	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499417409	CLIENT_LOGIN_ERROR	\N
7ac334e8-bb7a-4278-948b-faf8b43d86cd	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499417505	CLIENT_LOGIN_ERROR	\N
12527a82-865d-4d83-8d28-1658cb9b2e7e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499417547	CLIENT_LOGIN_ERROR	\N
891fcb37-17bc-4bb9-88de-ae86f6e5d969	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499417735	CLIENT_LOGIN_ERROR	\N
741b706b-5ee4-4b3a-af54-d04701b5ffc4	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499417779	CLIENT_LOGIN_ERROR	\N
aedd12d2-e483-4bf8-8e40-b4193bdfc20e	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499417884	CLIENT_LOGIN_ERROR	\N
c7079764-443e-4816-b757-e9f66ef9fd67	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499417925	CLIENT_LOGIN_ERROR	\N
4aba3172-a0b5-4681-a6bb-3862add4fad7	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499418024	CLIENT_LOGIN_ERROR	\N
2e820409-0ccb-4eb0-9f4c-bcf8d49081ec	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499418153	CLIENT_LOGIN_ERROR	\N
02d1b57c-bfe8-459b-a971-4304609e0673	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499418240	CLIENT_LOGIN_ERROR	\N
3e24d68f-2350-44f4-a72d-43ea4954350c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499418284	CLIENT_LOGIN_ERROR	\N
9db4626b-b2e6-4fe7-83b9-2ccfb4b706af	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499418461	CLIENT_LOGIN_ERROR	\N
fa4b28fb-6dee-4228-889b-4a3bf1796c9c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499418520	CLIENT_LOGIN_ERROR	\N
273f3358-ca28-4cea-a192-4f57218edbaf	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499418648	CLIENT_LOGIN_ERROR	\N
011f3387-fa82-4833-b3d6-76c0778298a6	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499418683	CLIENT_LOGIN_ERROR	\N
6bd09566-6cb4-4e97-88a5-661d6a79e7d9	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499418839	CLIENT_LOGIN_ERROR	\N
516f43a5-58f0-48ca-95c5-a2ca470c095f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499418884	CLIENT_LOGIN_ERROR	\N
5f6dfb01-4f2e-4bac-b2ff-5448fa38c1dc	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499418972	CLIENT_LOGIN_ERROR	\N
c300878b-c058-46b1-b0c3-ba44b2030155	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499419007	CLIENT_LOGIN_ERROR	\N
81ef6543-bdd9-461a-863a-e0782bde4fcf	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499419171	CLIENT_LOGIN_ERROR	\N
1867ea81-6750-4629-a5fe-f2357745698d	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499419206	CLIENT_LOGIN_ERROR	\N
09b07ef5-a7a6-4fa8-a88c-a498bf2f2f7f	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499419289	CLIENT_LOGIN_ERROR	\N
66803c12-5411-451b-a7b9-84e3101cecbb	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499419326	CLIENT_LOGIN_ERROR	\N
e73abf29-9f65-4be2-a187-91f054cd265c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499419490	CLIENT_LOGIN_ERROR	\N
b458d6ad-4674-4c3d-84b2-c78d39a4f277	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499419550	CLIENT_LOGIN_ERROR	\N
503cabff-bb5d-4cb3-9298-60d4e69232c6	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499419644	CLIENT_LOGIN_ERROR	\N
191610f1-f186-43f4-884a-e882ba73772b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499434821	CLIENT_LOGIN_ERROR	\N
163460fc-1d64-4132-bf13-3331a276d889	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499434911	CLIENT_LOGIN_ERROR	\N
748806f4-b558-4ba1-9dfd-f551b250c69c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499435002	CLIENT_LOGIN_ERROR	\N
137d2c7a-2202-4b59-b90b-233427f1c729	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499435025	CLIENT_LOGIN_ERROR	\N
a95bd6a4-ec86-44a0-a38f-c1e2758ce07b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499435193	CLIENT_LOGIN_ERROR	\N
6bd1bf65-6701-4ee2-ae66-b5e4441cdf94	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499435228	CLIENT_LOGIN_ERROR	\N
f23c2403-cf4f-40ea-bf86-d25df4770ec5	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499435325	CLIENT_LOGIN_ERROR	\N
19688507-a4e6-443b-b0e3-beb573694254	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499435347	CLIENT_LOGIN_ERROR	\N
04eba542-3ea5-4700-a643-5463779d92eb	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499435439	CLIENT_LOGIN_ERROR	\N
d4ec5a24-f8f7-4fae-88c2-8c30bd333755	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499435461	CLIENT_LOGIN_ERROR	\N
9a262cbd-00e8-4377-bc12-fe5235394502	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499435629	CLIENT_LOGIN_ERROR	\N
502b041f-6892-427e-b749-4c2b8453fdfc	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499435652	CLIENT_LOGIN_ERROR	\N
ab884213-a79e-4413-8955-a0ed3e43fa06	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499435738	CLIENT_LOGIN_ERROR	\N
a18b4647-b067-4e64-9ac8-3410af3b6b7b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499435761	CLIENT_LOGIN_ERROR	\N
7b996729-fa69-4c66-a158-cf1ddc16c03b	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499435927	CLIENT_LOGIN_ERROR	\N
a522acf4-c6be-4540-b388-6889bb522530	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499435954	CLIENT_LOGIN_ERROR	\N
ad818f9c-54c8-4905-a067-a46ef4aa5444	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499436041	CLIENT_LOGIN_ERROR	\N
46ffecba-8340-4e0e-bb36-c7aa244d3145	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499436067	CLIENT_LOGIN_ERROR	\N
89616185-0c73-4166-9351-70a1834fb850	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499436156	CLIENT_LOGIN_ERROR	\N
2532adc6-3f36-4d4c-8123-5e09619960f2	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499436184	CLIENT_LOGIN_ERROR	\N
1747a60e-f6b8-4317-ac61-16dcd70d0365	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499436345	CLIENT_LOGIN_ERROR	\N
d57b3993-367e-49b1-a8ca-9734d8c38965	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499436371	CLIENT_LOGIN_ERROR	\N
06c7c571-7f95-4f13-891d-2dd83ffe2093	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499436460	CLIENT_LOGIN_ERROR	\N
b39aa470-5fc4-456f-9b8a-7f13a9159f70	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499436483	CLIENT_LOGIN_ERROR	\N
43c21bb9-8d5c-46e0-8ded-348b2298d429	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499436647	CLIENT_LOGIN_ERROR	\N
6e5da686-18e5-4cb2-9a1f-db777ab2f622	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499436671	CLIENT_LOGIN_ERROR	\N
e3cb9591-b9bc-44c2-ab17-1dc2de2ca103	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499436757	CLIENT_LOGIN_ERROR	\N
d0f1406a-9c0b-4406-abed-614cc096259a	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499436780	CLIENT_LOGIN_ERROR	\N
daf5b6a6-888c-4c8b-a895-340cc194d8d4	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499436872	CLIENT_LOGIN_ERROR	\N
d34ed36a-4d64-4d5b-906f-d94cce5d463c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499436894	CLIENT_LOGIN_ERROR	\N
2979dc67-e1a1-4680-a5d9-f0059a7b9f2c	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499437056	CLIENT_LOGIN_ERROR	\N
50fa1e80-fba4-489f-9bb2-08e7de2d2fa2	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499437079	CLIENT_LOGIN_ERROR	\N
cca33c1d-a706-4377-83bd-1d8f1e449873	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499437169	CLIENT_LOGIN_ERROR	\N
d6d6ea4d-1f2d-46fa-a210-ea3649b463ba	backend	{"grant_type":"client_credentials"}	invalid_client_credentials	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694499437195	CLIENT_LOGIN_ERROR	\N
c08de7da-1918-4e3b-a4fe-41e2966acf2c	frontend	{"auth_method":"oauth_credentials","grant_type":"password","client_auth_method":"client-secret"}	consent_denied	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694502507778	LOGIN_ERROR	\N
1fda60fa-769a-42ed-94b4-e9069f499d01	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"deepak@probeplus.in"}	user_not_found	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694502541681	LOGIN_ERROR	\N
bdbb62c3-2ada-4a23-bdf6-e57778b0ddfc	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"deepak@probeplus.in"}	user_not_found	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694511153886	LOGIN_ERROR	\N
59014b3b-5376-4e27-afef-9e5a36febbad	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"deepak@probeplus.in"}	user_not_found	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694757829187	LOGIN_ERROR	\N
613ab80f-b3aa-4b9b-a305-e7584d2fc07f	frontend	{"auth_method":"openid-connect","grant_type":"password","client_auth_method":"client-secret","username":"deepak@probeplus.in"}	user_not_found	172.18.0.1	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1694757832023	LOGIN_ERROR	\N
4430f520-c3b5-4575-8e66-0a54d244c532	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695133196868	LOGIN_ERROR	\N
e6b8ae4a-534d-4e39-9523-edb8f146856e	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695133205889	LOGIN_ERROR	\N
febb6e7f-c098-41b1-83fc-2c686b06a048	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695133206794	LOGIN_ERROR	\N
093915ef-c327-4b81-a4e7-027138f3e585	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695133207453	LOGIN_ERROR	\N
4c67b550-be23-4b49-95e3-12e543cb9718	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695133208065	LOGIN_ERROR	\N
e419b60b-3236-4116-9330-b7a0b6d2f4c8	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695133289055	LOGIN_ERROR	\N
dc44df55-d4c7-4540-b376-d23c10bbf1ba	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695133289875	LOGIN_ERROR	\N
6ae4ab84-a322-44a2-8bab-5b43d3fecb16	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695133290464	LOGIN_ERROR	\N
4a82403c-8cb6-4402-9346-710de1460482	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695133599196	LOGIN_ERROR	\N
a2eb28cb-31f1-4484-9525-ce548e99fe35	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695133601344	LOGIN_ERROR	\N
db4f168a-afea-4fdb-b256-33fdafb580e2	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695133792030	LOGIN_ERROR	\N
734b97cd-55c0-4b62-81a7-00b2528eaea1	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695133792952	LOGIN_ERROR	\N
00be2a43-6f32-497c-b2b5-2789cc689905	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695133793566	LOGIN_ERROR	\N
ed837843-a914-4668-9fb3-c3a9e62d4951	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695133883373	LOGIN_ERROR	\N
97fa4a3e-6f05-4125-a86f-a85e5063fe1c	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695133884181	LOGIN_ERROR	\N
a3295688-6537-42c9-83b0-79a2fa2ef8a4	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695134238416	LOGIN_ERROR	\N
e477a267-22d0-4a0f-8bca-f85ce95a3eaa	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695134239458	LOGIN_ERROR	\N
79c2196a-bf0f-4efd-8212-767e9a04936a	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695134240371	LOGIN_ERROR	\N
4028f992-9c37-4391-86e2-508e1f2d831e	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695134241432	LOGIN_ERROR	\N
a753ea09-846b-4093-9d3c-7ef9ce8c38dd	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695134242556	LOGIN_ERROR	\N
d7e2e8db-42a2-4612-b5ad-0b5c691fadbf	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695134244923	LOGIN_ERROR	\N
9f266e69-279c-4861-8bd0-b65efcf7a016	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695134245932	LOGIN_ERROR	\N
8848ab05-2e49-49ec-902b-3bfa9e9b185c	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695134260739	LOGIN_ERROR	\N
758f2523-9efc-48a2-837c-825f0dee1565	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695134420586	LOGIN_ERROR	\N
50ab8f69-df6f-49e3-94c9-f653443c91c6	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695134602146	LOGIN_ERROR	\N
bd00a8a8-790f-4356-aec3-8bb23dd83838	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695134772759	LOGIN_ERROR	\N
06d8303f-1932-4651-99d9-6a9ae9ed0219	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695134960425	LOGIN_ERROR	\N
b135869f-e63d-4b79-831e-332cf2763f85	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695134961477	LOGIN_ERROR	\N
f3983520-85dd-4ffc-b9f1-ca2677a1413c	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695135009304	LOGIN_ERROR	\N
db3d4d10-0251-43f1-bae0-497cc80f8faf	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695135173358	LOGIN_ERROR	\N
92f9f6b5-1558-49b1-946c-69e4932864ab	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695135193380	LOGIN_ERROR	\N
e6f4c960-adf6-4dc7-a8af-d66fa12bc2c3	security-admin-console	{"auth_method":"openid-connect","auth_type":"code","redirect_uri":"http://192.168.1.3:3000/admin/master/console/","code_id":"5eb518cb-cca1-4362-a54a-c6480abf9ec4","username":"deepak@probeplus.in"}	user_not_found	192.168.1.3	a499feb5-9be3-463d-8e41-bfa85aed27f4	\N	1695135262427	LOGIN_ERROR	\N
eeb66484-0fca-4565-a429-327ef3b7dac3	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695135273897	LOGIN_ERROR	\N
d1d7850a-d0a5-4255-87da-358e02dbedc0	\N	null	cookie_not_found	192.168.1.3	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695135289075	LOGIN_ERROR	\N
75127ca5-367d-48b6-8d13-2d09647f82c7	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695135300532	LOGIN_ERROR	\N
f53bbb2c-4725-47c5-8f69-bc83ec7f6c7e	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695135345111	LOGIN_ERROR	\N
c534e25a-7cc9-4cd7-8b3e-739a88e6ecfc	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695135348048	LOGIN_ERROR	\N
e738491b-e9c3-4e3a-a991-17d9f5181c72	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695135351824	LOGIN_ERROR	\N
ecdc8ba1-6b80-41d4-a22d-822a958f0ad1	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695135473729	LOGIN_ERROR	\N
086ad59a-e8de-4de5-8a5d-05ecfbb6ff8f	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695135474780	LOGIN_ERROR	\N
cfeba46e-b350-45a4-a1b5-50d2764ff1ff	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695135475486	LOGIN_ERROR	\N
f027dbf7-3756-4e1b-9d94-13f0e7bdacf6	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695135487639	LOGIN_ERROR	\N
f4f94f72-56eb-41df-a639-3d035b7c7b30	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695135522084	LOGIN_ERROR	\N
5ae78b33-775a-4923-99cf-ce8925d64c6b	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695135523004	LOGIN_ERROR	\N
f7f758b8-3cde-4799-a216-7972c2c45f09	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695135619132	LOGIN_ERROR	\N
787de3b3-ea59-4e9f-b12d-7f68fc67a5b7	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695135642614	LOGIN_ERROR	\N
b261cd6f-44b4-4bac-90c1-9e41eed5e3b0	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695135644037	LOGIN_ERROR	\N
09507bb6-dc02-47c0-81c1-fdd8cd6ceb5f	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695135669029	LOGIN_ERROR	\N
24b7b9d0-6d6c-47ac-bcee-eb70eed47789	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695135697981	LOGIN_ERROR	\N
6f9f63ec-0f5c-4c85-aff1-fecb15eb90cf	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695136014498	LOGIN_ERROR	\N
6a33590b-013d-47f1-8afe-766d6035edbf	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695136015215	LOGIN_ERROR	\N
d5a4efb9-d04c-4df7-97cc-72b47dc99017	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695136015727	LOGIN_ERROR	\N
1b43d0a9-0991-4890-abaa-209a7b5e6093	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695136015991	LOGIN_ERROR	\N
c20f2e5a-844b-42fc-987c-a6c877c564a0	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695136226148	LOGIN_ERROR	\N
c3838380-332c-44cc-9d20-3f04a8852ee0	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695136720730	LOGIN_ERROR	\N
d6f4399a-025e-4c6e-9c20-debf24af3733	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695136721848	LOGIN_ERROR	\N
c659d460-e244-4a3f-969b-7892dc56bf67	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695136722768	LOGIN_ERROR	\N
66d3d6dd-5d92-452a-bbd9-aea4a8100cba	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695136738548	LOGIN_ERROR	\N
469db1ed-6f4e-46d5-82e0-03e2a5b00fed	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695136750471	LOGIN_ERROR	\N
c3a99f4e-c58b-48fa-9b63-03ebc6508be8	frontend	{"redirect_uri":"http://localhost:3000/"}	invalid_redirect_uri	192.168.1.6	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	1695136879314	LOGIN_ERROR	\N
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
9d9f0655-9a67-4aa7-886d-ccbe5377b2c4	facility_1	 	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
67c1eaf7-a431-4fdb-bfe3-22488d63480d	a499feb5-9be3-463d-8e41-bfa85aed27f4	f	${role_default-roles}	default-roles-master	a499feb5-9be3-463d-8e41-bfa85aed27f4	\N	\N
03ee2cde-c226-451c-a40c-cdf830105b93	a499feb5-9be3-463d-8e41-bfa85aed27f4	f	${role_admin}	admin	a499feb5-9be3-463d-8e41-bfa85aed27f4	\N	\N
f28e87b1-4c02-4753-a828-3e96aac24f8f	a499feb5-9be3-463d-8e41-bfa85aed27f4	f	${role_create-realm}	create-realm	a499feb5-9be3-463d-8e41-bfa85aed27f4	\N	\N
ec9bc5a0-1889-45af-9e4a-258650fbba2a	65d59271-d202-4383-9083-b9c879ae4a18	t	${role_create-client}	create-client	a499feb5-9be3-463d-8e41-bfa85aed27f4	65d59271-d202-4383-9083-b9c879ae4a18	\N
d9782775-0d8f-4b70-a000-81fdfe453949	65d59271-d202-4383-9083-b9c879ae4a18	t	${role_view-realm}	view-realm	a499feb5-9be3-463d-8e41-bfa85aed27f4	65d59271-d202-4383-9083-b9c879ae4a18	\N
dcff303f-36c9-4520-b8e4-8ebc93539319	65d59271-d202-4383-9083-b9c879ae4a18	t	${role_view-users}	view-users	a499feb5-9be3-463d-8e41-bfa85aed27f4	65d59271-d202-4383-9083-b9c879ae4a18	\N
1ac91e22-8961-4b81-a868-ff5d04c916aa	65d59271-d202-4383-9083-b9c879ae4a18	t	${role_view-clients}	view-clients	a499feb5-9be3-463d-8e41-bfa85aed27f4	65d59271-d202-4383-9083-b9c879ae4a18	\N
18e41cf7-fb08-4bef-8fd9-d9ba519505aa	65d59271-d202-4383-9083-b9c879ae4a18	t	${role_view-events}	view-events	a499feb5-9be3-463d-8e41-bfa85aed27f4	65d59271-d202-4383-9083-b9c879ae4a18	\N
7c419195-d486-4573-a44a-5748e10bcb65	65d59271-d202-4383-9083-b9c879ae4a18	t	${role_view-identity-providers}	view-identity-providers	a499feb5-9be3-463d-8e41-bfa85aed27f4	65d59271-d202-4383-9083-b9c879ae4a18	\N
11ae7426-fc1a-4952-b338-d9451fb73839	65d59271-d202-4383-9083-b9c879ae4a18	t	${role_view-authorization}	view-authorization	a499feb5-9be3-463d-8e41-bfa85aed27f4	65d59271-d202-4383-9083-b9c879ae4a18	\N
c35352e3-dcb2-4f48-b398-18fb1ac01e7b	65d59271-d202-4383-9083-b9c879ae4a18	t	${role_manage-realm}	manage-realm	a499feb5-9be3-463d-8e41-bfa85aed27f4	65d59271-d202-4383-9083-b9c879ae4a18	\N
979d9ec0-22b6-4bf1-ac5a-6d172e9aaefc	65d59271-d202-4383-9083-b9c879ae4a18	t	${role_manage-users}	manage-users	a499feb5-9be3-463d-8e41-bfa85aed27f4	65d59271-d202-4383-9083-b9c879ae4a18	\N
b32b77cf-5965-4297-8015-c19401ee3795	65d59271-d202-4383-9083-b9c879ae4a18	t	${role_manage-clients}	manage-clients	a499feb5-9be3-463d-8e41-bfa85aed27f4	65d59271-d202-4383-9083-b9c879ae4a18	\N
b16068b0-1c00-4e37-a5e4-c82c5a776f70	65d59271-d202-4383-9083-b9c879ae4a18	t	${role_manage-events}	manage-events	a499feb5-9be3-463d-8e41-bfa85aed27f4	65d59271-d202-4383-9083-b9c879ae4a18	\N
ccd82bd3-3238-4382-8df4-5234f92fc063	65d59271-d202-4383-9083-b9c879ae4a18	t	${role_manage-identity-providers}	manage-identity-providers	a499feb5-9be3-463d-8e41-bfa85aed27f4	65d59271-d202-4383-9083-b9c879ae4a18	\N
b09e2c8c-5e04-4c5b-8524-68f2c2988bea	65d59271-d202-4383-9083-b9c879ae4a18	t	${role_manage-authorization}	manage-authorization	a499feb5-9be3-463d-8e41-bfa85aed27f4	65d59271-d202-4383-9083-b9c879ae4a18	\N
f725a2fe-13bd-4249-8bb6-5a727840d41b	65d59271-d202-4383-9083-b9c879ae4a18	t	${role_query-users}	query-users	a499feb5-9be3-463d-8e41-bfa85aed27f4	65d59271-d202-4383-9083-b9c879ae4a18	\N
a083216f-77c4-43b2-a849-4ecd5ea44d7f	65d59271-d202-4383-9083-b9c879ae4a18	t	${role_query-clients}	query-clients	a499feb5-9be3-463d-8e41-bfa85aed27f4	65d59271-d202-4383-9083-b9c879ae4a18	\N
5b09ca0d-d1a5-4b5c-baca-380b67a0c67e	65d59271-d202-4383-9083-b9c879ae4a18	t	${role_query-realms}	query-realms	a499feb5-9be3-463d-8e41-bfa85aed27f4	65d59271-d202-4383-9083-b9c879ae4a18	\N
f3f1baff-2e87-442b-895a-c34c5aeecd2b	65d59271-d202-4383-9083-b9c879ae4a18	t	${role_query-groups}	query-groups	a499feb5-9be3-463d-8e41-bfa85aed27f4	65d59271-d202-4383-9083-b9c879ae4a18	\N
612c5ee2-10db-4071-a064-99689a9a4ad1	4d8abee8-263e-48f7-ad64-e9f9f428cc28	t	${role_view-profile}	view-profile	a499feb5-9be3-463d-8e41-bfa85aed27f4	4d8abee8-263e-48f7-ad64-e9f9f428cc28	\N
6797f4b8-ad7a-4855-af05-adc87afce98a	4d8abee8-263e-48f7-ad64-e9f9f428cc28	t	${role_manage-account}	manage-account	a499feb5-9be3-463d-8e41-bfa85aed27f4	4d8abee8-263e-48f7-ad64-e9f9f428cc28	\N
f54b47e3-d4fb-4014-a5ef-d8c4287a99bc	4d8abee8-263e-48f7-ad64-e9f9f428cc28	t	${role_manage-account-links}	manage-account-links	a499feb5-9be3-463d-8e41-bfa85aed27f4	4d8abee8-263e-48f7-ad64-e9f9f428cc28	\N
44ee6983-78ee-4240-a0e2-89ab7244036e	4d8abee8-263e-48f7-ad64-e9f9f428cc28	t	${role_view-applications}	view-applications	a499feb5-9be3-463d-8e41-bfa85aed27f4	4d8abee8-263e-48f7-ad64-e9f9f428cc28	\N
63df92ca-6e9f-4008-a4fb-949ecd821af8	4d8abee8-263e-48f7-ad64-e9f9f428cc28	t	${role_view-consent}	view-consent	a499feb5-9be3-463d-8e41-bfa85aed27f4	4d8abee8-263e-48f7-ad64-e9f9f428cc28	\N
f47da433-5f7c-4cbd-8f7f-aea3fd56b67e	4d8abee8-263e-48f7-ad64-e9f9f428cc28	t	${role_manage-consent}	manage-consent	a499feb5-9be3-463d-8e41-bfa85aed27f4	4d8abee8-263e-48f7-ad64-e9f9f428cc28	\N
89d47125-0e63-4bd4-a76c-fb8459c0fb8f	4d8abee8-263e-48f7-ad64-e9f9f428cc28	t	${role_view-groups}	view-groups	a499feb5-9be3-463d-8e41-bfa85aed27f4	4d8abee8-263e-48f7-ad64-e9f9f428cc28	\N
30c12c5b-462c-4249-907e-1ecbbbd2255c	4d8abee8-263e-48f7-ad64-e9f9f428cc28	t	${role_delete-account}	delete-account	a499feb5-9be3-463d-8e41-bfa85aed27f4	4d8abee8-263e-48f7-ad64-e9f9f428cc28	\N
52c565b2-381a-442f-8874-339879fa6a43	3ad50dbb-0371-4edd-9e4c-b46bf72206be	t	${role_read-token}	read-token	a499feb5-9be3-463d-8e41-bfa85aed27f4	3ad50dbb-0371-4edd-9e4c-b46bf72206be	\N
7aec9553-6301-421c-8a0c-753f48f99cb1	65d59271-d202-4383-9083-b9c879ae4a18	t	${role_impersonation}	impersonation	a499feb5-9be3-463d-8e41-bfa85aed27f4	65d59271-d202-4383-9083-b9c879ae4a18	\N
a899d539-c897-45c8-9174-7377a1661c44	a499feb5-9be3-463d-8e41-bfa85aed27f4	f	${role_offline-access}	offline_access	a499feb5-9be3-463d-8e41-bfa85aed27f4	\N	\N
af901d14-7be9-434f-a8f5-9cf941c4b71b	a499feb5-9be3-463d-8e41-bfa85aed27f4	f	${role_uma_authorization}	uma_authorization	a499feb5-9be3-463d-8e41-bfa85aed27f4	\N	\N
9077ec64-9ce5-4d03-9743-c4c31b0843cb	a3001d8f-6f17-45cd-a850-5425fe9fc808	t	${role_create-client}	create-client	a499feb5-9be3-463d-8e41-bfa85aed27f4	a3001d8f-6f17-45cd-a850-5425fe9fc808	\N
3da3ecea-247f-41d5-a442-5684d1950312	a3001d8f-6f17-45cd-a850-5425fe9fc808	t	${role_view-realm}	view-realm	a499feb5-9be3-463d-8e41-bfa85aed27f4	a3001d8f-6f17-45cd-a850-5425fe9fc808	\N
419abc55-e580-47c3-8b25-24c7884983f8	a3001d8f-6f17-45cd-a850-5425fe9fc808	t	${role_view-users}	view-users	a499feb5-9be3-463d-8e41-bfa85aed27f4	a3001d8f-6f17-45cd-a850-5425fe9fc808	\N
51fc769b-3b11-497c-bc8b-a63a991801c4	a3001d8f-6f17-45cd-a850-5425fe9fc808	t	${role_view-clients}	view-clients	a499feb5-9be3-463d-8e41-bfa85aed27f4	a3001d8f-6f17-45cd-a850-5425fe9fc808	\N
a25c0620-2777-4430-b925-6cf19973a613	a3001d8f-6f17-45cd-a850-5425fe9fc808	t	${role_view-events}	view-events	a499feb5-9be3-463d-8e41-bfa85aed27f4	a3001d8f-6f17-45cd-a850-5425fe9fc808	\N
6d0a2bcf-860f-4f0e-b48f-da96dd3c027b	a3001d8f-6f17-45cd-a850-5425fe9fc808	t	${role_view-identity-providers}	view-identity-providers	a499feb5-9be3-463d-8e41-bfa85aed27f4	a3001d8f-6f17-45cd-a850-5425fe9fc808	\N
bcc8e1d7-8907-42d8-b693-797ba40b8734	a3001d8f-6f17-45cd-a850-5425fe9fc808	t	${role_view-authorization}	view-authorization	a499feb5-9be3-463d-8e41-bfa85aed27f4	a3001d8f-6f17-45cd-a850-5425fe9fc808	\N
8df2d8b1-2863-46d8-a515-bdf827f0f340	a3001d8f-6f17-45cd-a850-5425fe9fc808	t	${role_manage-realm}	manage-realm	a499feb5-9be3-463d-8e41-bfa85aed27f4	a3001d8f-6f17-45cd-a850-5425fe9fc808	\N
798052c9-2596-4f14-b58b-bc9e8e8ba7da	a3001d8f-6f17-45cd-a850-5425fe9fc808	t	${role_manage-users}	manage-users	a499feb5-9be3-463d-8e41-bfa85aed27f4	a3001d8f-6f17-45cd-a850-5425fe9fc808	\N
b226c131-06b8-4a12-9676-e46934f43176	a3001d8f-6f17-45cd-a850-5425fe9fc808	t	${role_manage-clients}	manage-clients	a499feb5-9be3-463d-8e41-bfa85aed27f4	a3001d8f-6f17-45cd-a850-5425fe9fc808	\N
633802fb-228f-4f78-846d-e5dcd637affd	a3001d8f-6f17-45cd-a850-5425fe9fc808	t	${role_manage-events}	manage-events	a499feb5-9be3-463d-8e41-bfa85aed27f4	a3001d8f-6f17-45cd-a850-5425fe9fc808	\N
f436fa8a-1d29-4335-80e0-3d78aef3d46f	a3001d8f-6f17-45cd-a850-5425fe9fc808	t	${role_manage-identity-providers}	manage-identity-providers	a499feb5-9be3-463d-8e41-bfa85aed27f4	a3001d8f-6f17-45cd-a850-5425fe9fc808	\N
976ba71c-ea02-40df-8c5b-d4b38455cad5	a3001d8f-6f17-45cd-a850-5425fe9fc808	t	${role_manage-authorization}	manage-authorization	a499feb5-9be3-463d-8e41-bfa85aed27f4	a3001d8f-6f17-45cd-a850-5425fe9fc808	\N
8bba2ad9-edae-4102-947a-55d1f9faee4e	a3001d8f-6f17-45cd-a850-5425fe9fc808	t	${role_query-users}	query-users	a499feb5-9be3-463d-8e41-bfa85aed27f4	a3001d8f-6f17-45cd-a850-5425fe9fc808	\N
2da5dd9b-7421-49d1-b9c7-01c266d54050	a3001d8f-6f17-45cd-a850-5425fe9fc808	t	${role_query-clients}	query-clients	a499feb5-9be3-463d-8e41-bfa85aed27f4	a3001d8f-6f17-45cd-a850-5425fe9fc808	\N
398decc9-1cd5-44f8-ac94-a6fb5358de9f	a3001d8f-6f17-45cd-a850-5425fe9fc808	t	${role_query-realms}	query-realms	a499feb5-9be3-463d-8e41-bfa85aed27f4	a3001d8f-6f17-45cd-a850-5425fe9fc808	\N
61935426-1b8d-42fa-b409-a25838bb230f	a3001d8f-6f17-45cd-a850-5425fe9fc808	t	${role_query-groups}	query-groups	a499feb5-9be3-463d-8e41-bfa85aed27f4	a3001d8f-6f17-45cd-a850-5425fe9fc808	\N
c8871de4-0cb4-42af-8b83-55e83ec7d417	a3001d8f-6f17-45cd-a850-5425fe9fc808	t	${role_impersonation}	impersonation	a499feb5-9be3-463d-8e41-bfa85aed27f4	a3001d8f-6f17-45cd-a850-5425fe9fc808	\N
c90bf2ad-3447-4444-b3ba-21d3563688f6	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_manage-realm}	manage-realm	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
221c9293-f38b-458d-8400-db169a5b9d22	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_view-identity-providers}	view-identity-providers	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
6a1f4950-14c8-465e-ae14-361160c61345	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_create-client}	create-client	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
bbe55091-5055-47c2-835a-2123fc5ccd7d	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_query-realms}	query-realms	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
8cee6636-9527-4d12-895d-bf21e11ec843	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_impersonation}	impersonation	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
7d3614f0-de3f-405f-9524-8df3537c5335	0d4e2343-70bb-483a-ac8a-8c0ee9375046	t	${role_read-token}	read-token	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	0d4e2343-70bb-483a-ac8a-8c0ee9375046	\N
c6c53ef4-a3d9-43f8-ad86-0c61e2ab9fca	ce842fe5-3812-4965-bd2a-223b37637c1d	t	${role_delete-account}	delete-account	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	ce842fe5-3812-4965-bd2a-223b37637c1d	\N
0af23ec5-9c11-489f-bdb7-d2fdeef78d1d	ce842fe5-3812-4965-bd2a-223b37637c1d	t	${role_manage-account-links}	manage-account-links	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	ce842fe5-3812-4965-bd2a-223b37637c1d	\N
064dab66-9585-4f6c-8da5-c3ed93dcefa3	ce842fe5-3812-4965-bd2a-223b37637c1d	t	${role_view-groups}	view-groups	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	ce842fe5-3812-4965-bd2a-223b37637c1d	\N
65aa1435-eb72-4925-94ee-737c65c93089	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	f	${role_default-roles}	default-roles-ecgvue	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	\N
41864266-7c38-4cb7-8a53-acdd63a3105d	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	f	${role_uma_authorization}	uma_authorization	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	\N
745167cf-3a7e-4302-9027-f7ec388b2fa2	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	f	${role_offline-access}	offline_access	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	\N	\N
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_realm-admin}	realm-admin	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
235b7ba1-c0f3-414a-b2b6-6ba04f7e5f43	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_view-users}	view-users	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
1a3a4805-03f4-4a19-826c-e419e7d0e49b	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_view-events}	view-events	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
ea7f6cab-0b72-46cb-b805-580f886c7baa	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_view-realm}	view-realm	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
7b0e47f1-3687-4641-bfdc-c47728abf91e	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_view-clients}	view-clients	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
971c8a63-50f4-42fd-96fe-bff483996025	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_query-clients}	query-clients	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
5006cccc-ecf9-433c-80de-be06e6cbb81e	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_view-authorization}	view-authorization	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
2c4f22e3-d3dc-47e2-b8f0-fcde5236d0a8	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_query-groups}	query-groups	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
75dedb29-1dbd-4cdc-bba1-0bc0eb805b6a	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_manage-clients}	manage-clients	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
be87eb49-aa0c-490e-b78d-fd684d51f0c5	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_manage-authorization}	manage-authorization	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
449612b0-012c-4869-a65c-8f78ea22895f	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_manage-users}	manage-users	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
91b2d6d7-6b0c-4142-9c26-b2b45e0690ca	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_manage-identity-providers}	manage-identity-providers	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
43a70a76-90b5-4320-a274-126ffc80a1b6	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_manage-events}	manage-events	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
ea7d2f1c-cf6d-428f-91d4-4e63910186fa	fb57efd3-823f-4b3c-88ff-51e766fafefd	t	${role_query-users}	query-users	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	fb57efd3-823f-4b3c-88ff-51e766fafefd	\N
e789998b-0b9a-4f3f-9cba-5ce693d54b6b	ce842fe5-3812-4965-bd2a-223b37637c1d	t	${role_manage-account}	manage-account	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	ce842fe5-3812-4965-bd2a-223b37637c1d	\N
56bfe62c-bdb0-42f6-8351-4e38f6370a6e	ce842fe5-3812-4965-bd2a-223b37637c1d	t	${role_view-profile}	view-profile	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	ce842fe5-3812-4965-bd2a-223b37637c1d	\N
4e8f9d9f-d399-45ea-8113-71310cf26061	ce842fe5-3812-4965-bd2a-223b37637c1d	t	${role_view-applications}	view-applications	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	ce842fe5-3812-4965-bd2a-223b37637c1d	\N
eaa471ce-d6c2-4f77-8f95-55438bb50722	ce842fe5-3812-4965-bd2a-223b37637c1d	t	${role_manage-consent}	manage-consent	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	ce842fe5-3812-4965-bd2a-223b37637c1d	\N
ca95fa5d-e131-4d23-adab-ca29ab55ad47	ce842fe5-3812-4965-bd2a-223b37637c1d	t	${role_view-consent}	view-consent	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	ce842fe5-3812-4965-bd2a-223b37637c1d	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.migration_model (id, version, update_time) FROM stdin;
tu9a4	21.1.2	1693890702
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
b53fbc09-9b44-4355-b5a4-bfb483cc483c	audience resolve	openid-connect	oidc-audience-resolve-mapper	639e98fe-0dc7-430f-ab8b-f6cc61f0b6ee	\N
8a50ccce-ceb4-4d37-a2b2-a768c50ec7f8	locale	openid-connect	oidc-usermodel-attribute-mapper	94feba80-31ad-4ee0-8de3-1f4d35eba2e6	\N
64f2baeb-c918-4c31-afd0-1432f3236cdc	role list	saml	saml-role-list-mapper	\N	e9e51bde-fec7-44b1-a23d-123f0dcd16a8
a61bf7b8-da00-4c0d-a098-0f5fd45053ea	full name	openid-connect	oidc-full-name-mapper	\N	ea6a3813-0f00-4f50-b344-16caaed12d47
3d16f543-156b-4fe3-955c-aa5eb004a16b	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	ea6a3813-0f00-4f50-b344-16caaed12d47
79f9b875-b35b-447b-a267-f425b210333e	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	ea6a3813-0f00-4f50-b344-16caaed12d47
f2c61197-d4ad-4b28-a1b2-af57362a7c02	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	ea6a3813-0f00-4f50-b344-16caaed12d47
f5fe4fc0-981c-4a3d-9a44-3ee431fa120c	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	ea6a3813-0f00-4f50-b344-16caaed12d47
ffc3799a-c799-407d-8f5f-61aa479c1b5e	username	openid-connect	oidc-usermodel-attribute-mapper	\N	ea6a3813-0f00-4f50-b344-16caaed12d47
58c3d00a-97de-47ca-b5e4-8dcecb099d8a	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	ea6a3813-0f00-4f50-b344-16caaed12d47
94a6d870-9e7b-4c55-9aa8-6e37240b521c	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	ea6a3813-0f00-4f50-b344-16caaed12d47
b1a0ceea-2562-4c38-a4df-939eb4c45e1f	website	openid-connect	oidc-usermodel-attribute-mapper	\N	ea6a3813-0f00-4f50-b344-16caaed12d47
b44ae821-346c-4159-a2f3-8f44db316b71	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	ea6a3813-0f00-4f50-b344-16caaed12d47
b958749b-ba96-4d14-b3b2-cb5cb1ebc75a	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	ea6a3813-0f00-4f50-b344-16caaed12d47
96d6abd0-369c-4c60-a374-5bd8c2a48926	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	ea6a3813-0f00-4f50-b344-16caaed12d47
77de4b92-910b-4545-bb48-425ef81a0c07	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	ea6a3813-0f00-4f50-b344-16caaed12d47
e7db1068-92b4-499f-85ed-63272a0ee875	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	ea6a3813-0f00-4f50-b344-16caaed12d47
8039c746-0ade-46e4-877b-a96316c7b5f0	email	openid-connect	oidc-usermodel-attribute-mapper	\N	b6cf459a-f075-4d31-8945-75c1eb35d783
311821e4-6a18-4dd2-87e1-7b2cd7e28af2	email verified	openid-connect	oidc-usermodel-property-mapper	\N	b6cf459a-f075-4d31-8945-75c1eb35d783
ac52ee63-9d23-4a8c-af9b-c895314052f2	address	openid-connect	oidc-address-mapper	\N	843efda5-081d-4bfd-8cab-b7c2328fc311
74a8faaa-8b01-4013-906b-bcb4367c37ce	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	3ea530f7-8b0f-40fa-964a-f9f9ec93c326
ff08218f-b712-4183-aa61-b64c895bd3b7	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	3ea530f7-8b0f-40fa-964a-f9f9ec93c326
5563021e-b2a4-4621-8648-c5daedd33466	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	11a1b916-47fe-4094-bc38-be06b14dfed8
7a1f6c9a-5b10-4cc2-af97-894e3385fcac	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	11a1b916-47fe-4094-bc38-be06b14dfed8
41c95936-2ec1-408e-b011-0fd588d8cb2f	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	11a1b916-47fe-4094-bc38-be06b14dfed8
5d65effa-37f6-4432-8bcf-458325b94062	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	7ec167f3-226b-44af-a4c3-8f0b45c1eeac
861ee2bf-9632-4324-9649-f2849cce4da8	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	7d05b1cc-925a-4e26-82ec-93c8241cc4e9
f1fb4661-7bf9-4309-b381-3018dfcb6c52	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	7d05b1cc-925a-4e26-82ec-93c8241cc4e9
1e0865a6-1ac6-4c39-89df-5c7f3ccd58c1	acr loa level	openid-connect	oidc-acr-mapper	\N	460c4b11-54de-451c-9d9b-38c7f950d129
4e3c42f7-eeb2-4710-af90-5c8825d9e1f6	email	openid-connect	oidc-usermodel-property-mapper	\N	111caa50-b290-43a8-b04a-cce3c73dbefa
b452e76d-f041-4cc8-b6ff-5b752393ec53	email verified	openid-connect	oidc-usermodel-property-mapper	\N	111caa50-b290-43a8-b04a-cce3c73dbefa
40e69245-8ec5-4402-85ca-1511d67f29ff	role list	saml	saml-role-list-mapper	\N	1c24bfe0-68ec-457a-8fb9-8f6fccde0ba5
0b51f3f1-a8f6-42cc-90e4-7e3f75626ce2	acr loa level	openid-connect	oidc-acr-mapper	\N	0a18b98d-38e5-44d2-9332-1065b0c342dc
02db03ed-efc3-4a92-bae2-4a1ddd7e2212	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	474bd65f-db29-470c-a9c3-3ad8f8615a6f
e138e485-be95-4a28-b166-413b5de03a1c	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	d33b511f-1df4-4f3a-b4fd-8e7e0403f908
ae8adfc8-358e-4eeb-b6cc-8888913b8755	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	d33b511f-1df4-4f3a-b4fd-8e7e0403f908
3569f404-6572-43fe-9fe5-bbe3f62ebb4d	full name	openid-connect	oidc-full-name-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
926a53c9-43fc-4a7a-884f-3160d5d4f368	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
a74258ab-8023-46a9-b1d0-9cf7ecbd57fd	family name	openid-connect	oidc-usermodel-property-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
8c612bbc-cf22-4e8d-99ea-9bfcb1d0091b	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
6bc1ff18-ef37-47c8-ab1b-a7d6b758f48e	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
fdee5501-b021-4268-a7e7-830bae79ef53	given name	openid-connect	oidc-usermodel-property-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
86d53e21-f9c7-46d5-9a0a-219ce59d5072	website	openid-connect	oidc-usermodel-attribute-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
5a8550e9-c699-4180-9f07-c267fd4aab69	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
5010a54d-ff82-4a6b-a588-ad12d13171cb	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
6d6061fa-88be-43cd-a449-b5447008909b	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
9fe2d0db-4e74-48a4-9cb6-852320a00836	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
9152dbc2-e5d8-4e46-acfc-2e64e83aec8f	username	openid-connect	oidc-usermodel-property-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
ef8b868c-87e3-4f5d-b54b-e6adbb6977e2	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
26f67423-c0fa-47cf-9f61-e4fc7128d3e1	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	43869505-7a24-424e-9ada-0cef970169a5
454e36c1-6ea3-4384-85cc-7e9e51a49970	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	29945782-f537-4661-beb2-eb77c9d23669
3a6db17e-83bb-4839-8c6b-a5f2462b8126	upn	openid-connect	oidc-usermodel-property-mapper	\N	29945782-f537-4661-beb2-eb77c9d23669
a61e9f92-bc4b-483b-8388-9d9738f5c357	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	d5d707c6-4d4f-4bc9-8a5b-4e089040061d
f46e20e9-ba95-40fe-ba91-991fa87510b5	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	d5d707c6-4d4f-4bc9-8a5b-4e089040061d
ae73882b-8672-4af6-90c9-e1574a07506e	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	d5d707c6-4d4f-4bc9-8a5b-4e089040061d
a2f74ac3-1732-48e3-9af9-a15c91628312	address	openid-connect	oidc-address-mapper	\N	a86d5100-8b35-49e9-94c3-3952256a2ffc
647ea11e-691b-41ae-981d-7dc3803a20c1	audience resolve	openid-connect	oidc-audience-resolve-mapper	335fc954-d318-439c-a800-ec6890e7befc	\N
4fe4e367-d4d8-415e-abfb-762c03da3ce9	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	dedf63b3-4d87-4515-b7d4-8ee882db4bd1	\N
acea8205-61e9-42bf-a260-30c47eb7fd68	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	dedf63b3-4d87-4515-b7d4-8ee882db4bd1	\N
8f0d9947-ae53-4509-82ec-4e45b1980ab7	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	dedf63b3-4d87-4515-b7d4-8ee882db4bd1	\N
c17bfb4d-5d86-4ecd-84f0-f4c79f249583	ROLES	openid-connect	oidc-usermodel-attribute-mapper	e03a9c44-332a-48cd-8777-d544fd7d3feb	\N
ccccb2ca-695e-4496-8719-0935a274de19	SP_ROLE	openid-connect	oidc-usermodel-attribute-mapper	e03a9c44-332a-48cd-8777-d544fd7d3feb	\N
290fdc33-32a0-4deb-ae45-afb5fb9c3d70	SPID	openid-connect	oidc-usermodel-attribute-mapper	e03a9c44-332a-48cd-8777-d544fd7d3feb	\N
e1b3025a-ac58-4e6c-baef-6547bd4dd63b	SA ROLE	openid-connect	oidc-usermodel-attribute-mapper	e03a9c44-332a-48cd-8777-d544fd7d3feb	\N
3c2f0844-0526-4a3e-9d7d-e60233dbec88	CFID	openid-connect	oidc-usermodel-attribute-mapper	e03a9c44-332a-48cd-8777-d544fd7d3feb	\N
0b9c1cf8-4ea2-4d20-b583-286021f99870	User ID	openid-connect	oidc-usermodel-attribute-mapper	e03a9c44-332a-48cd-8777-d544fd7d3feb	\N
c1ea2141-97bd-44dd-852c-be3e038187a8	locale	openid-connect	oidc-usermodel-attribute-mapper	098636cc-5794-485f-ba91-8128deafe934	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
8a50ccce-ceb4-4d37-a2b2-a768c50ec7f8	true	userinfo.token.claim
8a50ccce-ceb4-4d37-a2b2-a768c50ec7f8	locale	user.attribute
8a50ccce-ceb4-4d37-a2b2-a768c50ec7f8	true	id.token.claim
8a50ccce-ceb4-4d37-a2b2-a768c50ec7f8	true	access.token.claim
8a50ccce-ceb4-4d37-a2b2-a768c50ec7f8	locale	claim.name
8a50ccce-ceb4-4d37-a2b2-a768c50ec7f8	String	jsonType.label
64f2baeb-c918-4c31-afd0-1432f3236cdc	false	single
64f2baeb-c918-4c31-afd0-1432f3236cdc	Basic	attribute.nameformat
64f2baeb-c918-4c31-afd0-1432f3236cdc	Role	attribute.name
3d16f543-156b-4fe3-955c-aa5eb004a16b	true	userinfo.token.claim
3d16f543-156b-4fe3-955c-aa5eb004a16b	lastName	user.attribute
3d16f543-156b-4fe3-955c-aa5eb004a16b	true	id.token.claim
3d16f543-156b-4fe3-955c-aa5eb004a16b	true	access.token.claim
3d16f543-156b-4fe3-955c-aa5eb004a16b	family_name	claim.name
3d16f543-156b-4fe3-955c-aa5eb004a16b	String	jsonType.label
58c3d00a-97de-47ca-b5e4-8dcecb099d8a	true	userinfo.token.claim
58c3d00a-97de-47ca-b5e4-8dcecb099d8a	profile	user.attribute
58c3d00a-97de-47ca-b5e4-8dcecb099d8a	true	id.token.claim
58c3d00a-97de-47ca-b5e4-8dcecb099d8a	true	access.token.claim
58c3d00a-97de-47ca-b5e4-8dcecb099d8a	profile	claim.name
58c3d00a-97de-47ca-b5e4-8dcecb099d8a	String	jsonType.label
77de4b92-910b-4545-bb48-425ef81a0c07	true	userinfo.token.claim
77de4b92-910b-4545-bb48-425ef81a0c07	locale	user.attribute
77de4b92-910b-4545-bb48-425ef81a0c07	true	id.token.claim
77de4b92-910b-4545-bb48-425ef81a0c07	true	access.token.claim
77de4b92-910b-4545-bb48-425ef81a0c07	locale	claim.name
77de4b92-910b-4545-bb48-425ef81a0c07	String	jsonType.label
79f9b875-b35b-447b-a267-f425b210333e	true	userinfo.token.claim
79f9b875-b35b-447b-a267-f425b210333e	firstName	user.attribute
79f9b875-b35b-447b-a267-f425b210333e	true	id.token.claim
79f9b875-b35b-447b-a267-f425b210333e	true	access.token.claim
79f9b875-b35b-447b-a267-f425b210333e	given_name	claim.name
79f9b875-b35b-447b-a267-f425b210333e	String	jsonType.label
94a6d870-9e7b-4c55-9aa8-6e37240b521c	true	userinfo.token.claim
94a6d870-9e7b-4c55-9aa8-6e37240b521c	picture	user.attribute
94a6d870-9e7b-4c55-9aa8-6e37240b521c	true	id.token.claim
94a6d870-9e7b-4c55-9aa8-6e37240b521c	true	access.token.claim
94a6d870-9e7b-4c55-9aa8-6e37240b521c	picture	claim.name
94a6d870-9e7b-4c55-9aa8-6e37240b521c	String	jsonType.label
96d6abd0-369c-4c60-a374-5bd8c2a48926	true	userinfo.token.claim
96d6abd0-369c-4c60-a374-5bd8c2a48926	zoneinfo	user.attribute
96d6abd0-369c-4c60-a374-5bd8c2a48926	true	id.token.claim
96d6abd0-369c-4c60-a374-5bd8c2a48926	true	access.token.claim
96d6abd0-369c-4c60-a374-5bd8c2a48926	zoneinfo	claim.name
96d6abd0-369c-4c60-a374-5bd8c2a48926	String	jsonType.label
a61bf7b8-da00-4c0d-a098-0f5fd45053ea	true	userinfo.token.claim
a61bf7b8-da00-4c0d-a098-0f5fd45053ea	true	id.token.claim
a61bf7b8-da00-4c0d-a098-0f5fd45053ea	true	access.token.claim
b1a0ceea-2562-4c38-a4df-939eb4c45e1f	true	userinfo.token.claim
b1a0ceea-2562-4c38-a4df-939eb4c45e1f	website	user.attribute
b1a0ceea-2562-4c38-a4df-939eb4c45e1f	true	id.token.claim
b1a0ceea-2562-4c38-a4df-939eb4c45e1f	true	access.token.claim
b1a0ceea-2562-4c38-a4df-939eb4c45e1f	website	claim.name
b1a0ceea-2562-4c38-a4df-939eb4c45e1f	String	jsonType.label
b44ae821-346c-4159-a2f3-8f44db316b71	true	userinfo.token.claim
b44ae821-346c-4159-a2f3-8f44db316b71	gender	user.attribute
b44ae821-346c-4159-a2f3-8f44db316b71	true	id.token.claim
b44ae821-346c-4159-a2f3-8f44db316b71	true	access.token.claim
b44ae821-346c-4159-a2f3-8f44db316b71	gender	claim.name
b44ae821-346c-4159-a2f3-8f44db316b71	String	jsonType.label
b958749b-ba96-4d14-b3b2-cb5cb1ebc75a	true	userinfo.token.claim
b958749b-ba96-4d14-b3b2-cb5cb1ebc75a	birthdate	user.attribute
b958749b-ba96-4d14-b3b2-cb5cb1ebc75a	true	id.token.claim
b958749b-ba96-4d14-b3b2-cb5cb1ebc75a	true	access.token.claim
b958749b-ba96-4d14-b3b2-cb5cb1ebc75a	birthdate	claim.name
b958749b-ba96-4d14-b3b2-cb5cb1ebc75a	String	jsonType.label
e7db1068-92b4-499f-85ed-63272a0ee875	true	userinfo.token.claim
e7db1068-92b4-499f-85ed-63272a0ee875	updatedAt	user.attribute
e7db1068-92b4-499f-85ed-63272a0ee875	true	id.token.claim
e7db1068-92b4-499f-85ed-63272a0ee875	true	access.token.claim
e7db1068-92b4-499f-85ed-63272a0ee875	updated_at	claim.name
e7db1068-92b4-499f-85ed-63272a0ee875	long	jsonType.label
f2c61197-d4ad-4b28-a1b2-af57362a7c02	true	userinfo.token.claim
f2c61197-d4ad-4b28-a1b2-af57362a7c02	middleName	user.attribute
f2c61197-d4ad-4b28-a1b2-af57362a7c02	true	id.token.claim
f2c61197-d4ad-4b28-a1b2-af57362a7c02	true	access.token.claim
f2c61197-d4ad-4b28-a1b2-af57362a7c02	middle_name	claim.name
f2c61197-d4ad-4b28-a1b2-af57362a7c02	String	jsonType.label
f5fe4fc0-981c-4a3d-9a44-3ee431fa120c	true	userinfo.token.claim
f5fe4fc0-981c-4a3d-9a44-3ee431fa120c	nickname	user.attribute
f5fe4fc0-981c-4a3d-9a44-3ee431fa120c	true	id.token.claim
f5fe4fc0-981c-4a3d-9a44-3ee431fa120c	true	access.token.claim
f5fe4fc0-981c-4a3d-9a44-3ee431fa120c	nickname	claim.name
f5fe4fc0-981c-4a3d-9a44-3ee431fa120c	String	jsonType.label
ffc3799a-c799-407d-8f5f-61aa479c1b5e	true	userinfo.token.claim
ffc3799a-c799-407d-8f5f-61aa479c1b5e	username	user.attribute
ffc3799a-c799-407d-8f5f-61aa479c1b5e	true	id.token.claim
ffc3799a-c799-407d-8f5f-61aa479c1b5e	true	access.token.claim
ffc3799a-c799-407d-8f5f-61aa479c1b5e	preferred_username	claim.name
ffc3799a-c799-407d-8f5f-61aa479c1b5e	String	jsonType.label
311821e4-6a18-4dd2-87e1-7b2cd7e28af2	true	userinfo.token.claim
311821e4-6a18-4dd2-87e1-7b2cd7e28af2	emailVerified	user.attribute
311821e4-6a18-4dd2-87e1-7b2cd7e28af2	true	id.token.claim
311821e4-6a18-4dd2-87e1-7b2cd7e28af2	true	access.token.claim
311821e4-6a18-4dd2-87e1-7b2cd7e28af2	email_verified	claim.name
311821e4-6a18-4dd2-87e1-7b2cd7e28af2	boolean	jsonType.label
8039c746-0ade-46e4-877b-a96316c7b5f0	true	userinfo.token.claim
8039c746-0ade-46e4-877b-a96316c7b5f0	email	user.attribute
8039c746-0ade-46e4-877b-a96316c7b5f0	true	id.token.claim
8039c746-0ade-46e4-877b-a96316c7b5f0	true	access.token.claim
8039c746-0ade-46e4-877b-a96316c7b5f0	email	claim.name
8039c746-0ade-46e4-877b-a96316c7b5f0	String	jsonType.label
ac52ee63-9d23-4a8c-af9b-c895314052f2	formatted	user.attribute.formatted
ac52ee63-9d23-4a8c-af9b-c895314052f2	country	user.attribute.country
ac52ee63-9d23-4a8c-af9b-c895314052f2	postal_code	user.attribute.postal_code
ac52ee63-9d23-4a8c-af9b-c895314052f2	true	userinfo.token.claim
ac52ee63-9d23-4a8c-af9b-c895314052f2	street	user.attribute.street
ac52ee63-9d23-4a8c-af9b-c895314052f2	true	id.token.claim
ac52ee63-9d23-4a8c-af9b-c895314052f2	region	user.attribute.region
ac52ee63-9d23-4a8c-af9b-c895314052f2	true	access.token.claim
ac52ee63-9d23-4a8c-af9b-c895314052f2	locality	user.attribute.locality
74a8faaa-8b01-4013-906b-bcb4367c37ce	true	userinfo.token.claim
74a8faaa-8b01-4013-906b-bcb4367c37ce	phoneNumber	user.attribute
74a8faaa-8b01-4013-906b-bcb4367c37ce	true	id.token.claim
74a8faaa-8b01-4013-906b-bcb4367c37ce	true	access.token.claim
74a8faaa-8b01-4013-906b-bcb4367c37ce	phone_number	claim.name
74a8faaa-8b01-4013-906b-bcb4367c37ce	String	jsonType.label
ff08218f-b712-4183-aa61-b64c895bd3b7	true	userinfo.token.claim
ff08218f-b712-4183-aa61-b64c895bd3b7	phoneNumberVerified	user.attribute
ff08218f-b712-4183-aa61-b64c895bd3b7	true	id.token.claim
ff08218f-b712-4183-aa61-b64c895bd3b7	true	access.token.claim
ff08218f-b712-4183-aa61-b64c895bd3b7	phone_number_verified	claim.name
ff08218f-b712-4183-aa61-b64c895bd3b7	boolean	jsonType.label
5563021e-b2a4-4621-8648-c5daedd33466	true	multivalued
5563021e-b2a4-4621-8648-c5daedd33466	foo	user.attribute
5563021e-b2a4-4621-8648-c5daedd33466	true	access.token.claim
5563021e-b2a4-4621-8648-c5daedd33466	realm_access.roles	claim.name
5563021e-b2a4-4621-8648-c5daedd33466	String	jsonType.label
7a1f6c9a-5b10-4cc2-af97-894e3385fcac	true	multivalued
7a1f6c9a-5b10-4cc2-af97-894e3385fcac	foo	user.attribute
7a1f6c9a-5b10-4cc2-af97-894e3385fcac	true	access.token.claim
7a1f6c9a-5b10-4cc2-af97-894e3385fcac	resource_access.${client_id}.roles	claim.name
7a1f6c9a-5b10-4cc2-af97-894e3385fcac	String	jsonType.label
861ee2bf-9632-4324-9649-f2849cce4da8	true	userinfo.token.claim
861ee2bf-9632-4324-9649-f2849cce4da8	username	user.attribute
861ee2bf-9632-4324-9649-f2849cce4da8	true	id.token.claim
861ee2bf-9632-4324-9649-f2849cce4da8	true	access.token.claim
861ee2bf-9632-4324-9649-f2849cce4da8	upn	claim.name
861ee2bf-9632-4324-9649-f2849cce4da8	String	jsonType.label
f1fb4661-7bf9-4309-b381-3018dfcb6c52	true	multivalued
f1fb4661-7bf9-4309-b381-3018dfcb6c52	foo	user.attribute
f1fb4661-7bf9-4309-b381-3018dfcb6c52	true	id.token.claim
f1fb4661-7bf9-4309-b381-3018dfcb6c52	true	access.token.claim
f1fb4661-7bf9-4309-b381-3018dfcb6c52	groups	claim.name
f1fb4661-7bf9-4309-b381-3018dfcb6c52	String	jsonType.label
1e0865a6-1ac6-4c39-89df-5c7f3ccd58c1	true	id.token.claim
1e0865a6-1ac6-4c39-89df-5c7f3ccd58c1	true	access.token.claim
6bc1ff18-ef37-47c8-ab1b-a7d6b758f48e	nickname	claim.name
6bc1ff18-ef37-47c8-ab1b-a7d6b758f48e	String	jsonType.label
6d6061fa-88be-43cd-a449-b5447008909b	true	userinfo.token.claim
6d6061fa-88be-43cd-a449-b5447008909b	middleName	user.attribute
6d6061fa-88be-43cd-a449-b5447008909b	true	id.token.claim
6d6061fa-88be-43cd-a449-b5447008909b	true	access.token.claim
6d6061fa-88be-43cd-a449-b5447008909b	middle_name	claim.name
6d6061fa-88be-43cd-a449-b5447008909b	String	jsonType.label
86d53e21-f9c7-46d5-9a0a-219ce59d5072	true	userinfo.token.claim
86d53e21-f9c7-46d5-9a0a-219ce59d5072	website	user.attribute
86d53e21-f9c7-46d5-9a0a-219ce59d5072	true	id.token.claim
86d53e21-f9c7-46d5-9a0a-219ce59d5072	true	access.token.claim
86d53e21-f9c7-46d5-9a0a-219ce59d5072	website	claim.name
86d53e21-f9c7-46d5-9a0a-219ce59d5072	String	jsonType.label
8c612bbc-cf22-4e8d-99ea-9bfcb1d0091b	true	userinfo.token.claim
8c612bbc-cf22-4e8d-99ea-9bfcb1d0091b	locale	user.attribute
8c612bbc-cf22-4e8d-99ea-9bfcb1d0091b	true	id.token.claim
8c612bbc-cf22-4e8d-99ea-9bfcb1d0091b	true	access.token.claim
8c612bbc-cf22-4e8d-99ea-9bfcb1d0091b	locale	claim.name
8c612bbc-cf22-4e8d-99ea-9bfcb1d0091b	String	jsonType.label
9152dbc2-e5d8-4e46-acfc-2e64e83aec8f	true	userinfo.token.claim
9152dbc2-e5d8-4e46-acfc-2e64e83aec8f	username	user.attribute
9152dbc2-e5d8-4e46-acfc-2e64e83aec8f	true	id.token.claim
9152dbc2-e5d8-4e46-acfc-2e64e83aec8f	true	access.token.claim
9152dbc2-e5d8-4e46-acfc-2e64e83aec8f	preferred_username	claim.name
9152dbc2-e5d8-4e46-acfc-2e64e83aec8f	String	jsonType.label
926a53c9-43fc-4a7a-884f-3160d5d4f368	true	userinfo.token.claim
926a53c9-43fc-4a7a-884f-3160d5d4f368	updatedAt	user.attribute
926a53c9-43fc-4a7a-884f-3160d5d4f368	true	id.token.claim
926a53c9-43fc-4a7a-884f-3160d5d4f368	true	access.token.claim
926a53c9-43fc-4a7a-884f-3160d5d4f368	updated_at	claim.name
926a53c9-43fc-4a7a-884f-3160d5d4f368	long	jsonType.label
9fe2d0db-4e74-48a4-9cb6-852320a00836	true	userinfo.token.claim
9fe2d0db-4e74-48a4-9cb6-852320a00836	zoneinfo	user.attribute
9fe2d0db-4e74-48a4-9cb6-852320a00836	true	id.token.claim
9fe2d0db-4e74-48a4-9cb6-852320a00836	true	access.token.claim
9fe2d0db-4e74-48a4-9cb6-852320a00836	zoneinfo	claim.name
9fe2d0db-4e74-48a4-9cb6-852320a00836	String	jsonType.label
a74258ab-8023-46a9-b1d0-9cf7ecbd57fd	true	userinfo.token.claim
a74258ab-8023-46a9-b1d0-9cf7ecbd57fd	lastName	user.attribute
a74258ab-8023-46a9-b1d0-9cf7ecbd57fd	true	id.token.claim
a74258ab-8023-46a9-b1d0-9cf7ecbd57fd	true	access.token.claim
a74258ab-8023-46a9-b1d0-9cf7ecbd57fd	family_name	claim.name
a74258ab-8023-46a9-b1d0-9cf7ecbd57fd	String	jsonType.label
ef8b868c-87e3-4f5d-b54b-e6adbb6977e2	true	userinfo.token.claim
ef8b868c-87e3-4f5d-b54b-e6adbb6977e2	picture	user.attribute
ef8b868c-87e3-4f5d-b54b-e6adbb6977e2	true	id.token.claim
ef8b868c-87e3-4f5d-b54b-e6adbb6977e2	true	access.token.claim
ef8b868c-87e3-4f5d-b54b-e6adbb6977e2	picture	claim.name
ef8b868c-87e3-4f5d-b54b-e6adbb6977e2	String	jsonType.label
fdee5501-b021-4268-a7e7-830bae79ef53	true	userinfo.token.claim
fdee5501-b021-4268-a7e7-830bae79ef53	firstName	user.attribute
fdee5501-b021-4268-a7e7-830bae79ef53	true	id.token.claim
fdee5501-b021-4268-a7e7-830bae79ef53	true	access.token.claim
fdee5501-b021-4268-a7e7-830bae79ef53	given_name	claim.name
fdee5501-b021-4268-a7e7-830bae79ef53	String	jsonType.label
3a6db17e-83bb-4839-8c6b-a5f2462b8126	true	userinfo.token.claim
3a6db17e-83bb-4839-8c6b-a5f2462b8126	username	user.attribute
3a6db17e-83bb-4839-8c6b-a5f2462b8126	true	id.token.claim
3a6db17e-83bb-4839-8c6b-a5f2462b8126	true	access.token.claim
3a6db17e-83bb-4839-8c6b-a5f2462b8126	upn	claim.name
3a6db17e-83bb-4839-8c6b-a5f2462b8126	String	jsonType.label
454e36c1-6ea3-4384-85cc-7e9e51a49970	true	multivalued
454e36c1-6ea3-4384-85cc-7e9e51a49970	true	userinfo.token.claim
454e36c1-6ea3-4384-85cc-7e9e51a49970	foo	user.attribute
454e36c1-6ea3-4384-85cc-7e9e51a49970	true	id.token.claim
454e36c1-6ea3-4384-85cc-7e9e51a49970	true	access.token.claim
454e36c1-6ea3-4384-85cc-7e9e51a49970	groups	claim.name
454e36c1-6ea3-4384-85cc-7e9e51a49970	String	jsonType.label
a61e9f92-bc4b-483b-8388-9d9738f5c357	foo	user.attribute
a61e9f92-bc4b-483b-8388-9d9738f5c357	true	access.token.claim
a61e9f92-bc4b-483b-8388-9d9738f5c357	resource_access.${client_id}.roles	claim.name
a61e9f92-bc4b-483b-8388-9d9738f5c357	String	jsonType.label
a61e9f92-bc4b-483b-8388-9d9738f5c357	true	multivalued
ae73882b-8672-4af6-90c9-e1574a07506e	foo	user.attribute
ae73882b-8672-4af6-90c9-e1574a07506e	true	access.token.claim
ae73882b-8672-4af6-90c9-e1574a07506e	realm_access.roles	claim.name
ae73882b-8672-4af6-90c9-e1574a07506e	String	jsonType.label
ae73882b-8672-4af6-90c9-e1574a07506e	true	multivalued
a2f74ac3-1732-48e3-9af9-a15c91628312	formatted	user.attribute.formatted
a2f74ac3-1732-48e3-9af9-a15c91628312	country	user.attribute.country
a2f74ac3-1732-48e3-9af9-a15c91628312	postal_code	user.attribute.postal_code
a2f74ac3-1732-48e3-9af9-a15c91628312	true	userinfo.token.claim
a2f74ac3-1732-48e3-9af9-a15c91628312	street	user.attribute.street
a2f74ac3-1732-48e3-9af9-a15c91628312	true	id.token.claim
a2f74ac3-1732-48e3-9af9-a15c91628312	region	user.attribute.region
a2f74ac3-1732-48e3-9af9-a15c91628312	true	access.token.claim
a2f74ac3-1732-48e3-9af9-a15c91628312	locality	user.attribute.locality
4fe4e367-d4d8-415e-abfb-762c03da3ce9	clientHost	user.session.note
4fe4e367-d4d8-415e-abfb-762c03da3ce9	true	userinfo.token.claim
4fe4e367-d4d8-415e-abfb-762c03da3ce9	true	id.token.claim
4fe4e367-d4d8-415e-abfb-762c03da3ce9	true	access.token.claim
4fe4e367-d4d8-415e-abfb-762c03da3ce9	clientHost	claim.name
4fe4e367-d4d8-415e-abfb-762c03da3ce9	String	jsonType.label
8f0d9947-ae53-4509-82ec-4e45b1980ab7	clientAddress	user.session.note
8f0d9947-ae53-4509-82ec-4e45b1980ab7	true	userinfo.token.claim
8f0d9947-ae53-4509-82ec-4e45b1980ab7	true	id.token.claim
8f0d9947-ae53-4509-82ec-4e45b1980ab7	true	access.token.claim
8f0d9947-ae53-4509-82ec-4e45b1980ab7	clientAddress	claim.name
8f0d9947-ae53-4509-82ec-4e45b1980ab7	String	jsonType.label
acea8205-61e9-42bf-a260-30c47eb7fd68	client_id	user.session.note
acea8205-61e9-42bf-a260-30c47eb7fd68	true	userinfo.token.claim
acea8205-61e9-42bf-a260-30c47eb7fd68	true	id.token.claim
acea8205-61e9-42bf-a260-30c47eb7fd68	true	access.token.claim
acea8205-61e9-42bf-a260-30c47eb7fd68	client_id	claim.name
acea8205-61e9-42bf-a260-30c47eb7fd68	String	jsonType.label
0b9c1cf8-4ea2-4d20-b583-286021f99870	false	aggregate.attrs
0b9c1cf8-4ea2-4d20-b583-286021f99870	true	userinfo.token.claim
0b9c1cf8-4ea2-4d20-b583-286021f99870	false	multivalued
0b9c1cf8-4ea2-4d20-b583-286021f99870	user_id	user.attribute
0b9c1cf8-4ea2-4d20-b583-286021f99870	false	id.token.claim
0b9c1cf8-4ea2-4d20-b583-286021f99870	true	access.token.claim
0b9c1cf8-4ea2-4d20-b583-286021f99870	user_id	claim.name
290fdc33-32a0-4deb-ae45-afb5fb9c3d70	false	aggregate.attrs
290fdc33-32a0-4deb-ae45-afb5fb9c3d70	false	multivalued
290fdc33-32a0-4deb-ae45-afb5fb9c3d70	true	userinfo.token.claim
290fdc33-32a0-4deb-ae45-afb5fb9c3d70	service_provider_id	user.attribute
290fdc33-32a0-4deb-ae45-afb5fb9c3d70	false	id.token.claim
290fdc33-32a0-4deb-ae45-afb5fb9c3d70	true	access.token.claim
290fdc33-32a0-4deb-ae45-afb5fb9c3d70	service_provider_id	claim.name
3c2f0844-0526-4a3e-9d7d-e60233dbec88	false	aggregate.attrs
3c2f0844-0526-4a3e-9d7d-e60233dbec88	true	userinfo.token.claim
3c2f0844-0526-4a3e-9d7d-e60233dbec88	false	multivalued
3c2f0844-0526-4a3e-9d7d-e60233dbec88	cfid	user.attribute
3c2f0844-0526-4a3e-9d7d-e60233dbec88	false	id.token.claim
3c2f0844-0526-4a3e-9d7d-e60233dbec88	true	access.token.claim
3c2f0844-0526-4a3e-9d7d-e60233dbec88	cfid	claim.name
c17bfb4d-5d86-4ecd-84f0-f4c79f249583	false	aggregate.attrs
c17bfb4d-5d86-4ecd-84f0-f4c79f249583	true	userinfo.token.claim
c17bfb4d-5d86-4ecd-84f0-f4c79f249583	false	multivalued
c17bfb4d-5d86-4ecd-84f0-f4c79f249583	roles	user.attribute
c17bfb4d-5d86-4ecd-84f0-f4c79f249583	false	id.token.claim
c17bfb4d-5d86-4ecd-84f0-f4c79f249583	true	access.token.claim
c17bfb4d-5d86-4ecd-84f0-f4c79f249583	roles	claim.name
ccccb2ca-695e-4496-8719-0935a274de19	false	aggregate.attrs
ccccb2ca-695e-4496-8719-0935a274de19	false	multivalued
ccccb2ca-695e-4496-8719-0935a274de19	true	userinfo.token.claim
ccccb2ca-695e-4496-8719-0935a274de19	sp_role	user.attribute
ccccb2ca-695e-4496-8719-0935a274de19	false	id.token.claim
ccccb2ca-695e-4496-8719-0935a274de19	true	access.token.claim
ccccb2ca-695e-4496-8719-0935a274de19	sp_role	claim.name
e1b3025a-ac58-4e6c-baef-6547bd4dd63b	false	aggregate.attrs
e1b3025a-ac58-4e6c-baef-6547bd4dd63b	false	multivalued
e1b3025a-ac58-4e6c-baef-6547bd4dd63b	true	userinfo.token.claim
e1b3025a-ac58-4e6c-baef-6547bd4dd63b	sa_role	user.attribute
e1b3025a-ac58-4e6c-baef-6547bd4dd63b	false	id.token.claim
e1b3025a-ac58-4e6c-baef-6547bd4dd63b	true	access.token.claim
e1b3025a-ac58-4e6c-baef-6547bd4dd63b	sa_role	claim.name
c1ea2141-97bd-44dd-852c-be3e038187a8	true	userinfo.token.claim
c1ea2141-97bd-44dd-852c-be3e038187a8	locale	user.attribute
c1ea2141-97bd-44dd-852c-be3e038187a8	true	id.token.claim
c1ea2141-97bd-44dd-852c-be3e038187a8	true	access.token.claim
c1ea2141-97bd-44dd-852c-be3e038187a8	locale	claim.name
c1ea2141-97bd-44dd-852c-be3e038187a8	String	jsonType.label
4e3c42f7-eeb2-4710-af90-5c8825d9e1f6	true	userinfo.token.claim
4e3c42f7-eeb2-4710-af90-5c8825d9e1f6	email	user.attribute
4e3c42f7-eeb2-4710-af90-5c8825d9e1f6	true	id.token.claim
4e3c42f7-eeb2-4710-af90-5c8825d9e1f6	true	access.token.claim
4e3c42f7-eeb2-4710-af90-5c8825d9e1f6	email	claim.name
4e3c42f7-eeb2-4710-af90-5c8825d9e1f6	String	jsonType.label
b452e76d-f041-4cc8-b6ff-5b752393ec53	true	userinfo.token.claim
b452e76d-f041-4cc8-b6ff-5b752393ec53	emailVerified	user.attribute
b452e76d-f041-4cc8-b6ff-5b752393ec53	true	id.token.claim
b452e76d-f041-4cc8-b6ff-5b752393ec53	true	access.token.claim
b452e76d-f041-4cc8-b6ff-5b752393ec53	email_verified	claim.name
b452e76d-f041-4cc8-b6ff-5b752393ec53	boolean	jsonType.label
40e69245-8ec5-4402-85ca-1511d67f29ff	false	single
40e69245-8ec5-4402-85ca-1511d67f29ff	Basic	attribute.nameformat
40e69245-8ec5-4402-85ca-1511d67f29ff	Role	attribute.name
0b51f3f1-a8f6-42cc-90e4-7e3f75626ce2	true	id.token.claim
0b51f3f1-a8f6-42cc-90e4-7e3f75626ce2	true	access.token.claim
0b51f3f1-a8f6-42cc-90e4-7e3f75626ce2	true	userinfo.token.claim
ae8adfc8-358e-4eeb-b6cc-8888913b8755	true	userinfo.token.claim
ae8adfc8-358e-4eeb-b6cc-8888913b8755	phoneNumber	user.attribute
ae8adfc8-358e-4eeb-b6cc-8888913b8755	true	id.token.claim
ae8adfc8-358e-4eeb-b6cc-8888913b8755	true	access.token.claim
ae8adfc8-358e-4eeb-b6cc-8888913b8755	phone_number	claim.name
ae8adfc8-358e-4eeb-b6cc-8888913b8755	String	jsonType.label
e138e485-be95-4a28-b166-413b5de03a1c	true	userinfo.token.claim
e138e485-be95-4a28-b166-413b5de03a1c	phoneNumberVerified	user.attribute
e138e485-be95-4a28-b166-413b5de03a1c	true	id.token.claim
e138e485-be95-4a28-b166-413b5de03a1c	true	access.token.claim
e138e485-be95-4a28-b166-413b5de03a1c	phone_number_verified	claim.name
e138e485-be95-4a28-b166-413b5de03a1c	boolean	jsonType.label
26f67423-c0fa-47cf-9f61-e4fc7128d3e1	true	userinfo.token.claim
26f67423-c0fa-47cf-9f61-e4fc7128d3e1	gender	user.attribute
26f67423-c0fa-47cf-9f61-e4fc7128d3e1	true	id.token.claim
26f67423-c0fa-47cf-9f61-e4fc7128d3e1	true	access.token.claim
26f67423-c0fa-47cf-9f61-e4fc7128d3e1	gender	claim.name
26f67423-c0fa-47cf-9f61-e4fc7128d3e1	String	jsonType.label
3569f404-6572-43fe-9fe5-bbe3f62ebb4d	true	id.token.claim
3569f404-6572-43fe-9fe5-bbe3f62ebb4d	true	access.token.claim
3569f404-6572-43fe-9fe5-bbe3f62ebb4d	true	userinfo.token.claim
5010a54d-ff82-4a6b-a588-ad12d13171cb	true	userinfo.token.claim
5010a54d-ff82-4a6b-a588-ad12d13171cb	birthdate	user.attribute
5010a54d-ff82-4a6b-a588-ad12d13171cb	true	id.token.claim
5010a54d-ff82-4a6b-a588-ad12d13171cb	true	access.token.claim
5010a54d-ff82-4a6b-a588-ad12d13171cb	birthdate	claim.name
5010a54d-ff82-4a6b-a588-ad12d13171cb	String	jsonType.label
5a8550e9-c699-4180-9f07-c267fd4aab69	true	userinfo.token.claim
5a8550e9-c699-4180-9f07-c267fd4aab69	profile	user.attribute
5a8550e9-c699-4180-9f07-c267fd4aab69	true	id.token.claim
5a8550e9-c699-4180-9f07-c267fd4aab69	true	access.token.claim
5a8550e9-c699-4180-9f07-c267fd4aab69	profile	claim.name
5a8550e9-c699-4180-9f07-c267fd4aab69	String	jsonType.label
6bc1ff18-ef37-47c8-ab1b-a7d6b758f48e	true	userinfo.token.claim
6bc1ff18-ef37-47c8-ab1b-a7d6b758f48e	nickname	user.attribute
6bc1ff18-ef37-47c8-ab1b-a7d6b758f48e	true	id.token.claim
6bc1ff18-ef37-47c8-ab1b-a7d6b758f48e	true	access.token.claim
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	60	300	300	\N	\N	\N	t	f	0	\N	ecgvue	0	\N	f	f	f	f	NONE	1800	36000	f	f	a3001d8f-6f17-45cd-a850-5425fe9fc808	1800	f	\N	f	f	f	t	0	1	30	6	HmacSHA1	totp	2daf7423-29eb-4353-89b9-f65429a7060b	fd042e85-027d-45fc-aa6e-fe2addb972ad	b76a2197-902a-4f31-b305-d2657f6aa68e	b46f6de2-41f4-4ac2-931c-1f197e9ac992	baf075fc-f8ab-4a57-8d55-f1d676379be6	2592000	f	900	t	f	b82128c1-e0ef-4b79-8be4-982b6912c0f0	0	f	0	0	65aa1435-eb72-4925-94ee-737c65c93089
a499feb5-9be3-463d-8e41-bfa85aed27f4	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	65d59271-d202-4383-9083-b9c879ae4a18	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	e20eb133-0f06-4a2f-9b59-b8f319e8c4f8	41c74f20-4b47-40a0-ba8f-6c3b6aea5599	4fac46a7-24e7-4638-babf-d1267b1d563a	d171b57a-4968-4b8d-9567-617140d10acc	34dd7d78-4d4c-4af6-9bb8-a126d2ca60b5	2592000	f	900	t	f	5669316a-5f82-4cc6-8217-a645cb67b3f7	0	f	0	0	67c1eaf7-a431-4fdb-bfe3-22488d63480d
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	a499feb5-9be3-463d-8e41-bfa85aed27f4	
_browser_header.xContentTypeOptions	a499feb5-9be3-463d-8e41-bfa85aed27f4	nosniff
_browser_header.xRobotsTag	a499feb5-9be3-463d-8e41-bfa85aed27f4	none
_browser_header.xFrameOptions	a499feb5-9be3-463d-8e41-bfa85aed27f4	SAMEORIGIN
_browser_header.contentSecurityPolicy	a499feb5-9be3-463d-8e41-bfa85aed27f4	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	a499feb5-9be3-463d-8e41-bfa85aed27f4	1; mode=block
_browser_header.strictTransportSecurity	a499feb5-9be3-463d-8e41-bfa85aed27f4	max-age=31536000; includeSubDomains
bruteForceProtected	a499feb5-9be3-463d-8e41-bfa85aed27f4	false
permanentLockout	a499feb5-9be3-463d-8e41-bfa85aed27f4	false
maxFailureWaitSeconds	a499feb5-9be3-463d-8e41-bfa85aed27f4	900
minimumQuickLoginWaitSeconds	a499feb5-9be3-463d-8e41-bfa85aed27f4	60
waitIncrementSeconds	a499feb5-9be3-463d-8e41-bfa85aed27f4	60
quickLoginCheckMilliSeconds	a499feb5-9be3-463d-8e41-bfa85aed27f4	1000
maxDeltaTimeSeconds	a499feb5-9be3-463d-8e41-bfa85aed27f4	43200
failureFactor	a499feb5-9be3-463d-8e41-bfa85aed27f4	30
realmReusableOtpCode	a499feb5-9be3-463d-8e41-bfa85aed27f4	false
displayName	a499feb5-9be3-463d-8e41-bfa85aed27f4	Keycloak
displayNameHtml	a499feb5-9be3-463d-8e41-bfa85aed27f4	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	a499feb5-9be3-463d-8e41-bfa85aed27f4	RS256
offlineSessionMaxLifespanEnabled	a499feb5-9be3-463d-8e41-bfa85aed27f4	false
offlineSessionMaxLifespan	a499feb5-9be3-463d-8e41-bfa85aed27f4	5184000
_browser_header.contentSecurityPolicyReportOnly	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	
_browser_header.xContentTypeOptions	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	nosniff
_browser_header.xRobotsTag	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	none
_browser_header.xFrameOptions	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	SAMEORIGIN
_browser_header.contentSecurityPolicy	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	1; mode=block
_browser_header.strictTransportSecurity	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	max-age=31536000; includeSubDomains
permanentLockout	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	false
maxFailureWaitSeconds	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	900
minimumQuickLoginWaitSeconds	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	60
waitIncrementSeconds	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	60
quickLoginCheckMilliSeconds	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	1000
maxDeltaTimeSeconds	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	43200
realmReusableOtpCode	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	false
bruteForceProtected	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	true
failureFactor	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	3
displayName	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	
displayNameHtml	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	
defaultSignatureAlgorithm	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	RS256
offlineSessionMaxLifespanEnabled	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	false
offlineSessionMaxLifespan	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	5184000
clientSessionIdleTimeout	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	0
clientSessionMaxLifespan	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	0
clientOfflineSessionIdleTimeout	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	0
clientOfflineSessionMaxLifespan	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	0
actionTokenGeneratedByAdminLifespan	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	43200
actionTokenGeneratedByUserLifespan	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	300
oauth2DeviceCodeLifespan	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	600
oauth2DevicePollingInterval	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	5
webAuthnPolicyRpEntityName	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	keycloak
webAuthnPolicySignatureAlgorithms	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	ES256
webAuthnPolicyRpId	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	
webAuthnPolicyAttestationConveyancePreference	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	not specified
webAuthnPolicyAuthenticatorAttachment	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	not specified
webAuthnPolicyRequireResidentKey	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	not specified
webAuthnPolicyUserVerificationRequirement	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	not specified
webAuthnPolicyCreateTimeout	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	0
webAuthnPolicyAvoidSameAuthenticatorRegister	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	false
webAuthnPolicyRpEntityNamePasswordless	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	ES256
webAuthnPolicyRpIdPasswordless	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	
webAuthnPolicyAttestationConveyancePreferencePasswordless	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	not specified
webAuthnPolicyRequireResidentKeyPasswordless	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	not specified
webAuthnPolicyCreateTimeoutPasswordless	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	false
cibaBackchannelTokenDeliveryMode	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	poll
cibaExpiresIn	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	120
cibaInterval	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	5
cibaAuthRequestedUserHint	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	login_hint
parRequestUriLifespan	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	60
frontendUrl	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	
acr.loa.map	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	{}
client-policies.profiles	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	{"profiles":[]}
client-policies.policies	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	{"policies":[]}
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
a499feb5-9be3-463d-8e41-bfa85aed27f4	jboss-logging
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	a499feb5-9be3-463d-8e41-bfa85aed27f4
password	password	t	t	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	Developer	replyToDisplayName
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	true	starttls
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	true	auth
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1		envelopeFrom
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	false	ssl
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	**********	password
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	587	port
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	smtp-relay.brevo.com	host
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	deepak@probeplus.in	replyTo
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	deepak@probeplus.in	from
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	Developer	fromDisplayName
e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	deepakbaskar@outlook.com	user
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.redirect_uris (client_id, value) FROM stdin;
4d8abee8-263e-48f7-ad64-e9f9f428cc28	/realms/master/account/*
639e98fe-0dc7-430f-ab8b-f6cc61f0b6ee	/realms/master/account/*
94feba80-31ad-4ee0-8de3-1f4d35eba2e6	/admin/master/console/*
ce842fe5-3812-4965-bd2a-223b37637c1d	/realms/ecgvue/account/*
335fc954-d318-439c-a800-ec6890e7befc	/realms/ecgvue/account/*
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	/*
098636cc-5794-485f-ba91-8128deafe934	/admin/ecgvue/console/*
e03a9c44-332a-48cd-8777-d544fd7d3feb	http://10.10.2.146:4200/*
e03a9c44-332a-48cd-8777-d544fd7d3feb	http://localhost:4200/*
e03a9c44-332a-48cd-8777-d544fd7d3feb	https://www.ecgvue.site/*
e03a9c44-332a-48cd-8777-d544fd7d3feb	http://localhost:3000/
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
2cf1cf68-aad4-4778-87ef-02410a583101	VERIFY_EMAIL	Verify Email	a499feb5-9be3-463d-8e41-bfa85aed27f4	t	f	VERIFY_EMAIL	50
35af9b2c-c78c-4379-a33e-1189f6e38eac	UPDATE_PROFILE	Update Profile	a499feb5-9be3-463d-8e41-bfa85aed27f4	t	f	UPDATE_PROFILE	40
46694b23-2486-41cc-9e94-5d145b60ba54	CONFIGURE_TOTP	Configure OTP	a499feb5-9be3-463d-8e41-bfa85aed27f4	t	f	CONFIGURE_TOTP	10
04ea7dae-2a1b-42d4-b35c-a1c90c085e44	UPDATE_PASSWORD	Update Password	a499feb5-9be3-463d-8e41-bfa85aed27f4	t	f	UPDATE_PASSWORD	30
e71f164b-3189-4393-9a36-7799d24d8f56	TERMS_AND_CONDITIONS	Terms and Conditions	a499feb5-9be3-463d-8e41-bfa85aed27f4	f	f	TERMS_AND_CONDITIONS	20
73eb81c3-0a2e-4593-9ff1-526baf3b7260	delete_account	Delete Account	a499feb5-9be3-463d-8e41-bfa85aed27f4	f	f	delete_account	60
b65ba70e-4776-492d-a4b3-4dbd189eaae3	update_user_locale	Update User Locale	a499feb5-9be3-463d-8e41-bfa85aed27f4	t	f	update_user_locale	1000
395df77d-e412-42ea-9a54-6eb0ecfa70bd	webauthn-register	Webauthn Register	a499feb5-9be3-463d-8e41-bfa85aed27f4	t	f	webauthn-register	70
8d2b110e-21ee-475b-ac30-8e39d99b3697	webauthn-register-passwordless	Webauthn Register Passwordless	a499feb5-9be3-463d-8e41-bfa85aed27f4	t	f	webauthn-register-passwordless	80
8d21895f-27f6-47b8-9ca4-cc0f1e2eaf1e	CONFIGURE_TOTP	Configure OTP	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	t	f	CONFIGURE_TOTP	10
ef16befc-9d15-4540-b24a-76a0fa0934ec	TERMS_AND_CONDITIONS	Terms and Conditions	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	f	f	TERMS_AND_CONDITIONS	20
12ae57e2-c806-436c-b65e-dc7715bbb118	UPDATE_PASSWORD	Update Password	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	t	f	UPDATE_PASSWORD	30
568a52f0-d971-4a11-bc12-c0b9eb117bb2	UPDATE_PROFILE	Update Profile	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	t	f	UPDATE_PROFILE	40
ff3153c7-2c9e-42f7-96a9-76e6b76fc209	VERIFY_EMAIL	Verify Email	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	t	f	VERIFY_EMAIL	50
e40a6ba8-41fb-40c4-9f22-eed57f31a6cf	delete_account	Delete Account	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	f	f	delete_account	60
62bfc7a6-0e3b-411d-ab85-1b8c2908da0e	webauthn-register	Webauthn Register	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	t	f	webauthn-register	70
8e1336e4-9864-49ca-99e3-206293756109	webauthn-register-passwordless	Webauthn Register Passwordless	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	t	f	webauthn-register-passwordless	80
629f7241-a244-4dec-81a3-c58975aed028	update_user_locale	Update User Locale	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	t	f	update_user_locale	1000
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
639e98fe-0dc7-430f-ab8b-f6cc61f0b6ee	89d47125-0e63-4bd4-a76c-fb8459c0fb8f
639e98fe-0dc7-430f-ab8b-f6cc61f0b6ee	6797f4b8-ad7a-4855-af05-adc87afce98a
335fc954-d318-439c-a800-ec6890e7befc	064dab66-9585-4f6c-8da5-c3ed93dcefa3
335fc954-d318-439c-a800-ec6890e7befc	e789998b-0b9a-4f3f-9cba-5ce693d54b6b
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
user_id	USRIMEUOD	2fd6ef3d-9172-4976-a8fd-2e41604f8d31	5d59102a-86c1-4757-a2b1-570c8864575c
roles	admin	2fd6ef3d-9172-4976-a8fd-2e41604f8d31	00ace1b5-3798-4fff-a094-eb23ff22e147
facility_id	FY1YE	2fd6ef3d-9172-4976-a8fd-2e41604f8d31	eb6d4cf4-8891-4429-853d-0e94bca3bad3
user_id	USRR12WA7	cacce085-332a-449b-a695-523c7afbca74	dd63656e-a26e-485c-b411-019b4e5bbe51
roles	handler	cacce085-332a-449b-a695-523c7afbca74	9bd59ece-245c-481c-a61c-96a56feef055
facility_id	FY1YE	cacce085-332a-449b-a695-523c7afbca74	6319f014-921b-455d-9af6-f315b892b7d5
user_id	USREDB3BQ	f393fe46-2543-45d4-8aa2-2a2358e48d6b	6868f0bb-dd42-45f3-8c21-fd1a4399d858
roles	handler	f393fe46-2543-45d4-8aa2-2a2358e48d6b	0c40b636-4210-43f6-83f4-45ca6ad04ada
facility_id	FY1YE	f393fe46-2543-45d4-8aa2-2a2358e48d6b	24a6afea-d450-4964-89d5-2a0fa858d33e
user_id	USRAFS3W2	2f8393d9-a007-4504-a29f-4e95cc46b9c8	8f388c4d-cb88-4d73-adf4-256e25b7800b
roles	handler	2f8393d9-a007-4504-a29f-4e95cc46b9c8	4e7164a6-e45a-4a05-85be-80d630100846
facility_id	FY1YE	2f8393d9-a007-4504-a29f-4e95cc46b9c8	d08995f6-68b2-435d-b3ea-5b70df359d1e
user_id	USRTP1JBV	19232b93-e939-4ed4-a3bc-26a1ab06e90a	e73ef2b8-0811-474c-adc5-7ef61599ec44
roles	enroller	19232b93-e939-4ed4-a3bc-26a1ab06e90a	41c39b9e-8b8d-4a81-a751-883e68667c0b
facility_id	FY1YE	19232b93-e939-4ed4-a3bc-26a1ab06e90a	39c64af5-6c57-41eb-b62b-fe8c5c16e56b
user_id	USRV7JR2D	3573dd18-16ab-4aaa-bf68-63182751aba2	839f8955-5979-44bb-960c-d0f9bbb9ed19
roles	handler	3573dd18-16ab-4aaa-bf68-63182751aba2	4f7e5c4f-c8ea-4699-8e8c-6870a7636140
facility_id	FY1YE	3573dd18-16ab-4aaa-bf68-63182751aba2	9ebe7661-8cfa-49fa-86e3-22a75b331b8a
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
4bb33f6d-fee0-4075-bc8a-7c3a7c3dbd5c	\N	5b422c2d-5379-4dc6-abbc-26926319b458	f	t	\N	\N	\N	a499feb5-9be3-463d-8e41-bfa85aed27f4	admin	1693890703725	\N	0
2fd6ef3d-9172-4976-a8fd-2e41604f8d31	deepak@probeplus.in	deepak@probeplus.in	f	t	\N	deepak	b	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	9876043213	1695017315665	\N	0
cacce085-332a-449b-a695-523c7afbca74	deepak+1@probeplus.in	deepak+1@probeplus.in	f	t	\N	deepak	b	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	9876543243	1695017332202	\N	0
f393fe46-2543-45d4-8aa2-2a2358e48d6b	deepak+2@probeplus.in	deepak+2@probeplus.in	f	t	\N	deepak	b	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	9876543244	1695017364371	\N	0
2f8393d9-a007-4504-a29f-4e95cc46b9c8	deepak+3@probeplus.in	deepak+3@probeplus.in	f	t	\N	queue two	user three	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	9876543425	1695217971919	\N	0
3573dd18-16ab-4aaa-bf68-63182751aba2	deepak+4@probeplus.in	deepak+4@probeplus.in	f	t	\N	handler	four	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	9812345678	1695224159506	\N	0
19232b93-e939-4ed4-a3bc-26a1ab06e90a	enroller+1@probeplus.in	enroller+1@probeplus.in	f	t	\N	enroller	one	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	9876556789	1695223101931	\N	0
240f2d38-c410-472f-93e9-60406577d2bb	\N	168aa5d4-5ed5-47c2-a0f4-c000de925943	f	t	\N	\N	\N	e9ae9a82-2cd4-4a6c-90f1-364e776ea8f1	service-account-backend	1686652044914	dedf63b3-4d87-4515-b7d4-8ee882db4bd1	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
67c1eaf7-a431-4fdb-bfe3-22488d63480d	4bb33f6d-fee0-4075-bc8a-7c3a7c3dbd5c
03ee2cde-c226-451c-a40c-cdf830105b93	4bb33f6d-fee0-4075-bc8a-7c3a7c3dbd5c
65aa1435-eb72-4925-94ee-737c65c93089	2fd6ef3d-9172-4976-a8fd-2e41604f8d31
65aa1435-eb72-4925-94ee-737c65c93089	cacce085-332a-449b-a695-523c7afbca74
65aa1435-eb72-4925-94ee-737c65c93089	f393fe46-2543-45d4-8aa2-2a2358e48d6b
65aa1435-eb72-4925-94ee-737c65c93089	2f8393d9-a007-4504-a29f-4e95cc46b9c8
65aa1435-eb72-4925-94ee-737c65c93089	3573dd18-16ab-4aaa-bf68-63182751aba2
7bd6b0c9-c71a-409c-9d15-ce17cb3fb473	240f2d38-c410-472f-93e9-60406577d2bb
65aa1435-eb72-4925-94ee-737c65c93089	19232b93-e939-4ed4-a3bc-26a1ab06e90a
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: bn_keycloak
--

COPY public.web_origins (client_id, value) FROM stdin;
94feba80-31ad-4ee0-8de3-1f4d35eba2e6	+
dedf63b3-4d87-4515-b7d4-8ee882db4bd1	/*
098636cc-5794-485f-ba91-8128deafe934	+
e03a9c44-332a-48cd-8777-d544fd7d3feb	http://10.10.2.146:4200
e03a9c44-332a-48cd-8777-d544fd7d3feb	https://www.ecgvue.site
e03a9c44-332a-48cd-8777-d544fd7d3feb	http://localhost:4200
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: bn_keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: bn_keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: bn_keycloak
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO bn_keycloak;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

