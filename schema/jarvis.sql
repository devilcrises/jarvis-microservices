create table countries
(
    id            bigint unsigned auto_increment
        primary key,
    uuid          varchar(255)                        not null,
    name          varchar(255) charset utf8           not null,
    code          varchar(50)                         not null,
    dialing_code  varchar(50)                         not null,
    pincode_regex varchar(255)                        null,
    status        varchar(50)                         not null,
    created_at    timestamp default CURRENT_TIMESTAMP null,
    modified_at   timestamp                           null,
    constraint countries_uuid_uindex
        unique (uuid)
);

create table countries_audit
(
    id            bigint unsigned auto_increment
        primary key,
    uuid          varchar(255)                        null,
    name          varchar(255) charset utf8           null,
    code          varchar(50)                         null,
    dialing_code  varchar(50)                         null,
    pincode_regex varchar(255)                        null,
    device_id     varchar(255)                        null,
    ip_address    varchar(255)                        null,
    request_id    varchar(255)                        null,
    request_type  varchar(50)                         null,
    requester     varchar(255)                        null,
    user_agent    varchar(255)                        null,
    status        varchar(50)                         null,
    created_at    timestamp default CURRENT_TIMESTAMP null,
    modified_at   timestamp                           null,
    constraint countries_uuid_uindex
        unique (uuid)
);

create table currencies
(
    id          bigint unsigned auto_increment
        primary key,
    uuid        varchar(255)                        not null,
    name        varchar(255)                        null,
    code        varchar(50)                         null,
    status      varchar(50)                         null,
    created_at  timestamp default CURRENT_TIMESTAMP not null,
    modified_at timestamp                           null,
    constraint currencies_uuid_uindex
        unique (uuid)
);

create table currencies_audit
(
    id           bigint unsigned auto_increment
        primary key,
    uuid         varchar(255)                        null,
    name         varchar(255)                        null,
    code         varchar(50)                         null,
    device_id    varchar(255)                        null,
    ip_address   varchar(255)                        null,
    request_id   varchar(255)                        null,
    request_type varchar(50)                         null,
    requester    varchar(255)                        null,
    user_agent   varchar(255)                        null,
    status       varchar(50)                         null,
    created_at   timestamp default CURRENT_TIMESTAMP null,
    modified_at  timestamp                           null
);

create table currencies_countries_map
(
    id            bigint unsigned auto_increment
        primary key,
    uuid          varchar(255)                        not null,
    currency_uuid varchar(255)                        null,
    currency_code varchar(255)                        null,
    country_code  varchar(255)                        null,
    country_uuid  varchar(255)                        null,
    status        varchar(50)                         not null,
    created_at    timestamp default CURRENT_TIMESTAMP not null,
    modified_at   timestamp                           null,
    constraint currencies_countries_map_uuid_uindex
        unique (uuid)
);

create table currencies_countries_map_audit
(
    id            bigint unsigned auto_increment
        primary key,
    uuid          varchar(255)                        null,
    currency_uuid varchar(255)                        null,
    currency_code varchar(255)                        null,
    country_code  varchar(255)                        null,
    country_uuid  varchar(255)                        null,
    device_id     varchar(255)                        null,
    ip_address    varchar(255)                        null,
    request_id    varchar(255)                        null,
    request_type  varchar(50)                         null,
    requester     varchar(255)                        null,
    user_agent    varchar(255)                        null,
    status        varchar(50)                         null,
    created_at    timestamp default CURRENT_TIMESTAMP null,
    modified_at   timestamp                           null
);

create table experts
(
    id             bigint unsigned auto_increment
        primary key,
    uuid           varchar(255)                        not null,
    utm_uuid       varchar(255)                        null,
    expert_qr_code varchar(255)                        null,
    experts_type   varchar(255)                        null,
    service_type   varchar(255)                        null,
    status         varchar(50)                         not null,
    created_at     timestamp default CURRENT_TIMESTAMP not null,
    modified_at    timestamp                           null,
    constraint experts_expert_qr_code_uindex
        unique (expert_qr_code),
    constraint experts_uuid_uindex
        unique (uuid)
);

create table experts_audit
(
    id             bigint unsigned auto_increment
        primary key,
    uuid           varchar(255)                        null,
    utm_uuid       varchar(255)                        null,
    expert_qr_code varchar(255)                        null,
    experts_type   varchar(255)                        null,
    service_type   varchar(255)                        null,
    device_id      varchar(255)                        null,
    ip_address     varchar(255)                        null,
    request_id     varchar(255)                        null,
    request_type   varchar(50)                         null,
    requester      varchar(255)                        null,
    user_agent     varchar(255)                        null,
    status         varchar(50)                         null,
    created_at     timestamp default CURRENT_TIMESTAMP null,
    modified_at    timestamp                           null
);

create table members
(
    id                bigint unsigned auto_increment
        primary key,
    uuid              varchar(255)                        not null,
    utm_uuid          varchar(255)                        not null,
    member_qr_code    varchar(255)                        not null,
    member_experience varchar(255)                        null,
    status            varchar(50)                         null,
    created_at        timestamp default CURRENT_TIMESTAMP not null,
    modified_at       timestamp                           null,
    constraint members_member_qr_code_uindex
        unique (member_qr_code),
    constraint members_uuid_uindex
        unique (uuid)
);

create table members_audit
(
    id                bigint unsigned auto_increment
        primary key,
    uuid              varchar(255)                        null,
    utm_uuid          varchar(255)                        null,
    member_qr_code    varchar(255)                        null,
    member_experience varchar(255)                        null,
    device_id         varchar(255)                        null,
    ip_address        varchar(255)                        null,
    request_id        varchar(255)                        null,
    request_type      varchar(50)                         null,
    requester         varchar(255)                        null,
    user_agent        varchar(255)                        null,
    status            varchar(50)                         null,
    created_at        timestamp default CURRENT_TIMESTAMP null,
    modified_at       timestamp                           null
);

create table user
(
    id            bigint unsigned auto_increment
        primary key,
    uuid          varchar(255)                        not null,
    first_name    varchar(255)                        not null,
    last_name     varchar(255)                        null,
    gender        varchar(50)                         null,
    user_country  varchar(255)                        null,
    user_currency varchar(255)                        null,
    onboard_date  timestamp                           null,
    onboard_city  varchar(255)                        null,
    active_city   varchar(255)                        null,
    lead_source   varchar(255)                        null,
    status        varchar(100)                        null,
    created_at    timestamp default CURRENT_TIMESTAMP not null,
    modified_at   timestamp                           null,
    constraint user_uuid_uindex
        unique (uuid)
);

create table user_audit
(
    id            bigint unsigned auto_increment
        primary key,
    uuid          varchar(255)                        null,
    first_name    varchar(255)                        null,
    last_name     varchar(255)                        null,
    gender        varchar(50)                         null,
    user_country  varchar(255)                        null,
    user_currency varchar(255)                        null,
    onboard_date  timestamp                           null,
    onboard_city  varchar(255)                        null,
    active_city   varchar(255)                        null,
    lead_source   varchar(255)                        null,
    device_id     varchar(255)                        null,
    ip_address    varchar(255)                        null,
    request_id    varchar(255)                        null,
    request_type  varchar(50)                         null,
    requester     varchar(255)                        null,
    user_agent    varchar(255)                        null,
    status        varchar(100)                        null,
    created_at    timestamp default CURRENT_TIMESTAMP null,
    modified_at   timestamp                           null
);

create table user_bank_details
(
    id                  bigint unsigned auto_increment
        primary key,
    uuid                varchar(255)                        not null,
    user_uuid           varchar(255)                        not null,
    bank_name           varchar(255) charset utf8           null,
    bank_ifsc           varchar(255)                        null,
    bank_account_number varchar(255)                        null,
    upi_address         varchar(255)                        null,
    status              varchar(50)                         null,
    created_at          timestamp default CURRENT_TIMESTAMP not null,
    modified_at         timestamp                           null,
    constraint user_bank_details_uuid_uindex
        unique (uuid)
);

create table user_bank_details_audit
(
    id                  bigint unsigned auto_increment
        primary key,
    uuid                varchar(255)                        null,
    user_uuid           varchar(255)                        null,
    bank_name           varchar(255) charset utf8           null,
    bank_ifsc           varchar(255)                        null,
    bank_account_number varchar(255)                        null,
    upi_address         varchar(255)                        null,
    device_id           varchar(255)                        null,
    ip_address          varchar(255)                        null,
    request_id          varchar(255)                        null,
    request_type        varchar(50)                         null,
    requester           varchar(255)                        null,
    user_agent          varchar(255)                        null,
    status              varchar(50)                         null,
    created_at          timestamp default CURRENT_TIMESTAMP null,
    modified_at         timestamp                           null
);

create table user_details
(
    id               bigint unsigned auto_increment
        primary key,
    uuid             varchar(255)                        not null,
    user_uuid        varchar(255)                        not null,
    address          varchar(255)                        null,
    alternate_mobile varchar(255)                        null,
    dob              varchar(255)                        null,
    display_pic_url  varchar(255)                        null,
    status           varchar(50)                         not null,
    created_at       timestamp default CURRENT_TIMESTAMP not null,
    modified_at      timestamp                           null,
    constraint user_details_uuid_uindex
        unique (uuid)
);

create table user_details_audit
(
    id               bigint unsigned auto_increment
        primary key,
    uuid             varchar(255)                        null,
    user_uuid        varchar(255)                        null,
    address          varchar(255)                        null,
    alternate_mobile varchar(255)                        null,
    dob              varchar(255)                        null,
    device_id        varchar(255)                        null,
    ip_address       varchar(255)                        null,
    request_id       varchar(255)                        null,
    request_type     varchar(50)                         null,
    requester        varchar(255)                        null,
    user_agent       varchar(255)                        null,
    status           varchar(50)                         null,
    created_at       timestamp default CURRENT_TIMESTAMP null,
    modified_at      timestamp                           null
);

create table user_identities
(
    id              bigint unsigned auto_increment
        primary key,
    uuid            varchar(255)                        not null,
    user_id         bigint unsigned                     not null,
    user_uuid       varchar(255)                        not null,
    tenant          varchar(255)                        not null,
    type            varchar(255)                        null,
    value           varchar(255)                        null,
    dialing_code    varchar(50)                         null,
    is_otp_verified tinyint(1)                          not null,
    is_primary      tinyint(1)                          not null,
    utmUUID         varchar(255)                        null,
    status          varchar(50)                         not null,
    created_at      timestamp default CURRENT_TIMESTAMP not null,
    modified_at     timestamp                           null,
    constraint user_identities_uuid_uindex
        unique (uuid)
);

create table user_identities_audit
(
    id              bigint unsigned auto_increment
        primary key,
    uuid            varchar(255)                        null,
    user_id         bigint unsigned                     null,
    user_uuid       varchar(255)                        null,
    tenant          varchar(255)                        null,
    type            varchar(255)                        null,
    value           varchar(255)                        null,
    dialing_code    varchar(50)                         null,
    is_otp_verified tinyint(1)                          null,
    is_primary      tinyint(1)                          null,
    device_id       varchar(255)                        null,
    ip_address      varchar(255)                        null,
    request_id      varchar(255)                        null,
    request_type    varchar(50)                         null,
    requester       varchar(255)                        null,
    user_agent      varchar(255)                        null,
    status          varchar(50)                         null,
    created_at      timestamp default CURRENT_TIMESTAMP null,
    modified_at     timestamp                           null
);

create table users_identities_verification
(
    id                         bigint unsigned auto_increment
        primary key,
    uuid                       varchar(255)                        not null,
    user_uuid                  varchar(255)                        not null,
    user_id                    bigint unsigned                     not null,
    tenant                     varchar(255)                        not null,
    type                       varchar(255)                        not null,
    value                      varchar(255)                        null,
    dialing_code               varchar(255)                        null,
    verification_type          varchar(255)                        not null,
    verification_token         varchar(255)                        null,
    verification_token_entered varchar(255)                        null,
    login_attempts             int                                 null,
    login_attempts_left        int                                 null,
    resend_attempts            int                                 null,
    resend_attempts_left       int                                 null,
    verification_attempts      int                                 null,
    verification_attempts_left int                                 null,
    is_otp_verified            tinyint(1)                          not null,
    is_primary                 tinyint(1)                          null,
    status                     varchar(50)                         not null,
    created_at                 timestamp default CURRENT_TIMESTAMP not null,
    modified_at                timestamp                           null,
    constraint users_identities_verification_uuid_uindex
        unique (uuid)
);

create table users_identities_verification_audit
(
    id                         bigint unsigned auto_increment
        primary key,
    uuid                       varchar(255)                        null,
    user_uuid                  varchar(255)                        null,
    user_id                    bigint unsigned                     null,
    tenant                     varchar(255)                        null,
    type                       varchar(255)                        null,
    value                      varchar(255)                        null,
    dialing_code               varchar(255)                        null,
    verification_type          varchar(255)                        null,
    verification_token         varchar(255)                        null,
    verification_token_entered varchar(255)                        null,
    login_attempts             int                                 null,
    login_attempts_left        int                                 null,
    resend_attempts            int                                 null,
    resend_attempts_left       int                                 null,
    verification_attempts      int                                 null,
    verification_attempts_left int                                 null,
    is_otp_verified            tinyint(1)                          null,
    is_primary                 tinyint(1)                          null,
    device_id                  varchar(255)                        null,
    ip_address                 varchar(255)                        null,
    request_id                 varchar(255)                        null,
    request_type               varchar(50)                         null,
    requester                  varchar(255)                        null,
    user_agent                 varchar(255)                        null,
    status                     varchar(50)                         null,
    created_at                 timestamp default CURRENT_TIMESTAMP null,
    modified_at                timestamp                           null
);

create table users_tenant_map
(
    id                    bigint unsigned auto_increment
        primary key,
    uuid                  varchar(255)                        not null,
    user_id               bigint unsigned                     not null,
    user_uuid             varchar(255)                        not null,
    tenant                varchar(255)                        not null,
    user_tags             json                                null,
    roles                 json                                null,
    verification_comments varchar(255)                        null,
    status                varchar(50)                         not null,
    created_at            timestamp default CURRENT_TIMESTAMP not null,
    modified_at           timestamp                           null,
    constraint users_tenant_map_uuid_uindex
        unique (uuid)
);

create table users_tenant_map_audit
(
    id                    bigint unsigned auto_increment
        primary key,
    uuid                  varchar(255)                        null,
    user_id               bigint unsigned                     null,
    user_uuid             varchar(255)                        null,
    tenant                varchar(255)                        null,
    user_tags             json                                null,
    roles                 json                                null,
    verification_comments varchar(255)                        null,
    device_id             varchar(255)                        null,
    ip_address            varchar(255)                        null,
    request_id            varchar(255)                        null,
    request_type          varchar(50)                         null,
    requester             varchar(255)                        null,
    user_agent            varchar(255)                        null,
    status                varchar(50)                         null,
    created_at            timestamp default CURRENT_TIMESTAMP null,
    modified_at           timestamp                           null
);

create table whitelist
(
    id           bigint unsigned auto_increment
        primary key,
    uuid         varchar(255)                        not null,
    email        varchar(255)                        not null,
    tenant       varchar(255)                        null,
    channel_id   varchar(255)                        not null,
    channel_type varchar(255)                        null,
    status       varchar(255)                        not null,
    created_at   timestamp default CURRENT_TIMESTAMP not null,
    modified_at  timestamp                           null,
    constraint whitelist_uuid_uindex
        unique (uuid)
);

create table jarvis.user_referral_info
(
    id                  bigint unsigned auto_increment
        primary key,
    uuid                varchar(255)                        null,
    user_uuid           varchar(255)                        null,
    utm_uuid            varchar(255)                        null,
    tenant              varchar(255)                        null,
    referring_user_uuid varchar(255)                        null,
    invite_code         varchar(255)                        null,
    app_version         varchar(255)                        null,
    app_type            varchar(255)                        null,
    device_id           varchar(255)                        null,
    ipAddress           varchar(255)                        null,
    status              varchar(255)                        null,
    created_at          timestamp default CURRENT_TIMESTAMP null,
    modified_at         timestamp                           null,
    constraint user_referral_info_uuid_uindex
        unique (uuid)
);
alter table jarvis.user_referral_info
    change ipAddress ip_address varchar(255) null;

create index user_identities_user_uuid_value_tenant_index
    on user_identities (user_uuid, value, tenant);

create index whitelist_email_index
    on whitelist (email);

create index users_tenant_map_user_uuid_tenant_index
    on users_tenant_map (user_uuid, tenant);

create index user_details_user_uuid_index
    on user_details (user_uuid);

alter table user
    add COLUMN user_name varchar(255) null after gender;

CREATE TABLE `user_waitlist_details_audit`
(
    `id`           bigint unsigned NOT NULL AUTO_INCREMENT,
    `uuid`         varchar(255)    NOT NULL,
    `first_name`   varchar(255)         DEFAULT NULL,
    `last_name`    varchar(255)         DEFAULT NULL,
    `phone`        varchar(255)         DEFAULT NULL,
    `dialing_code` varchar(10)          DEFAULT NULL,
    `email`        varchar(255)         DEFAULT NULL,
    `user_name`    varchar(255)         DEFAULT NULL,
    `device_id`    varchar(255)         DEFAULT NULL,
    `ip_address`   varchar(255)         DEFAULT NULL,
    `request_id`   varchar(255)         DEFAULT NULL,
    `request_type` varchar(50)          DEFAULT NULL,
    `requester`    varchar(255)         DEFAULT NULL,
    `user_agent`   varchar(255)         DEFAULT NULL,
    `status`       varchar(255)         DEFAULT NULL,
    `created_at`   timestamp       NULL DEFAULT NULL,
    `modified_at`  timestamp       NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `user_waitlist_details_uuid_uindex` (`uuid`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `user_waitlist_details`
(
    `id`           bigint unsigned NOT NULL AUTO_INCREMENT,
    `uuid`         varchar(255)    NOT NULL,
    `first_name`   varchar(255)         DEFAULT NULL,
    `last_name`    varchar(255)         DEFAULT NULL,
    `phone`        varchar(255)         DEFAULT NULL,
    `dialing_code` varchar(10)          DEFAULT NULL,
    `email`        varchar(255)         DEFAULT NULL,
    `user_name`    varchar(255)         DEFAULT NULL,
    `status`       varchar(255)         DEFAULT NULL,
    `created_at`   timestamp       NULL DEFAULT NULL,
    `modified_at`  timestamp       NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uwd_uuid_uindex` (`uuid`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `user_invite_map`
(
    `id`           bigint unsigned NOT NULL AUTO_INCREMENT,
    `uuid`         varchar(255)    NOT NULL,
    `invite_code`  varchar(255)        DEFAULT NULL,
    `utm_uuid`     varchar(255)        DEFAULT NULL,
    `tenant`       varchar(255)        DEFAULT NULL,
    `user_uuid`    varchar(255)        DEFAULT NULL,
    `cid`          varchar(255)        DEFAULT NULL,
    `channel_type` varchar(255)        DEFAULT NULL,
    `channel_id`   varchar(255)        DEFAULT NULL,
    `status`       varchar(50)         DEFAULT NULL,
    `created_at`   timestamp      NOT NULL,
    `modified_at`  timestamp      NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `user_invite_map_uuid_uindex` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

CREATE TABLE `user_invite_map_audit`
(
    `id`           bigint unsigned NOT NULL AUTO_INCREMENT,
    `uuid`         varchar(255)    NOT NULL,
    `invite_code`  varchar(255)        DEFAULT NULL,
    `utm_uuid`     varchar(255)        DEFAULT NULL,
    `tenant`       varchar(255)        DEFAULT NULL,
    `user_uuid`    varchar(255)        DEFAULT NULL,
    `cid`          varchar(255)        DEFAULT NULL,
    `channel_type` varchar(255)        DEFAULT NULL,
    `channel_id`   varchar(255)        DEFAULT NULL,
    `device_id`    varchar(255)         DEFAULT NULL,
    `ip_address`   varchar(255)         DEFAULT NULL,
    `request_id`   varchar(255)         DEFAULT NULL,
    `request_type` varchar(50)          DEFAULT NULL,
    `requester`    varchar(255)         DEFAULT NULL,
    `user_agent`   varchar(255)         DEFAULT NULL,
    `status`       varchar(255)         DEFAULT NULL,
    `created_at`   timestamp       NULL DEFAULT NULL,
    `modified_at`  timestamp       NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `user_invite_map_uuid_uindex` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

CREATE TABLE `user_referral_audit`
(
    `id`                  bigint       NOT NULL AUTO_INCREMENT,
    `created_at`          datetime     NOT NULL,
    `modified_at`         datetime     DEFAULT NULL,
    `status`              varchar(255) NOT NULL,
    `uuid`                varchar(255) NOT NULL,
    `device_id`           varchar(255) DEFAULT NULL,
    `ip_address`          varchar(255) DEFAULT NULL,
    `request_id`          varchar(255) DEFAULT NULL,
    `request_type`        varchar(255) NOT NULL,
    `requester`           varchar(255) NOT NULL,
    `user_agent`          varchar(255) DEFAULT NULL,
    `invite_code`         varchar(255) DEFAULT NULL,
    `referring_user_uuid` varchar(255) DEFAULT NULL,
    `tenant`              varchar(255) DEFAULT NULL,
    `user_uuid`           varchar(255) DEFAULT NULL,
    `utm_uuid`            varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

create table whitelist_audit
(
    id             bigint unsigned auto_increment
        primary key,create table countries
        (
        id            bigint unsigned auto_increment
        primary key,
        uuid          varchar(255)                        not null,
        name          varchar(255) charset utf8           not null,
        code          varchar(50)                         not null,
        dialing_code  varchar(50)                         not null,
        pincode_regex varchar(255)                        null,
        status        varchar(50)                         not null,
        created_at    timestamp default CURRENT_TIMESTAMP null,
        modified_at   timestamp                           null,
        constraint countries_uuid_uindex
        unique (uuid)
        );

create table countries_audit
(
    id            bigint unsigned auto_increment
        primary key,
    uuid          varchar(255)                        null,
    name          varchar(255) charset utf8           null,
    code          varchar(50)                         null,
    dialing_code  varchar(50)                         null,
    pincode_regex varchar(255)                        null,
    device_id     varchar(255)                        null,
    ip_address    varchar(255)                        null,
    request_id    varchar(255)                        null,
    request_type  varchar(50)                         null,
    requester     varchar(255)                        null,
    user_agent    varchar(255)                        null,
    status        varchar(50)                         null,
    created_at    timestamp default CURRENT_TIMESTAMP null,
    modified_at   timestamp                           null,
    constraint countries_uuid_uindex
        unique (uuid)
);

create table currencies
(
    id          bigint unsigned auto_increment
        primary key,
    uuid        varchar(255)                        not null,
    name        varchar(255)                        null,
    code        varchar(50)                         null,
    status      varchar(50)                         null,
    created_at  timestamp default CURRENT_TIMESTAMP not null,
    modified_at timestamp                           null,
    constraint currencies_uuid_uindex
        unique (uuid)
);

create table currencies_audit
(
    id           bigint unsigned auto_increment
        primary key,
    uuid         varchar(255)                        null,
    name         varchar(255)                        null,
    code         varchar(50)                         null,
    device_id    varchar(255)                        null,
    ip_address   varchar(255)                        null,
    request_id   varchar(255)                        null,
    request_type varchar(50)                         null,
    requester    varchar(255)                        null,
    user_agent   varchar(255)                        null,
    status       varchar(50)                         null,
    created_at   timestamp default CURRENT_TIMESTAMP null,
    modified_at  timestamp                           null
);

create table currencies_countries_map
(
    id            bigint unsigned auto_increment
        primary key,
    uuid          varchar(255)                        not null,
    currency_uuid varchar(255)                        null,
    currency_code varchar(255)                        null,
    country_code  varchar(255)                        null,
    country_uuid  varchar(255)                        null,
    status        varchar(50)                         not null,
    created_at    timestamp default CURRENT_TIMESTAMP not null,
    modified_at   timestamp                           null,
    constraint currencies_countries_map_uuid_uindex
        unique (uuid)
);

create table currencies_countries_map_audit
(
    id            bigint unsigned auto_increment
        primary key,
    uuid          varchar(255)                        null,
    currency_uuid varchar(255)                        null,
    currency_code varchar(255)                        null,
    country_code  varchar(255)                        null,
    country_uuid  varchar(255)                        null,
    device_id     varchar(255)                        null,
    ip_address    varchar(255)                        null,
    request_id    varchar(255)                        null,
    request_type  varchar(50)                         null,
    requester     varchar(255)                        null,
    user_agent    varchar(255)                        null,
    status        varchar(50)                         null,
    created_at    timestamp default CURRENT_TIMESTAMP null,
    modified_at   timestamp                           null
);

create table experts
(
    id             bigint unsigned auto_increment
        primary key,
    uuid           varchar(255)                        not null,
    utm_uuid       varchar(255)                        null,
    expert_qr_code varchar(255)                        null,
    experts_type   varchar(255)                        null,
    service_type   varchar(255)                        null,
    status         varchar(50)                         not null,
    created_at     timestamp default CURRENT_TIMESTAMP not null,
    modified_at    timestamp                           null,
    constraint experts_expert_qr_code_uindex
        unique (expert_qr_code),
    constraint experts_uuid_uindex
        unique (uuid)
);

create table experts_audit
(
    id             bigint unsigned auto_increment
        primary key,
    uuid           varchar(255)                        null,
    utm_uuid       varchar(255)                        null,
    expert_qr_code varchar(255)                        null,
    experts_type   varchar(255)                        null,
    service_type   varchar(255)                        null,
    device_id      varchar(255)                        null,
    ip_address     varchar(255)                        null,
    request_id     varchar(255)                        null,
    request_type   varchar(50)                         null,
    requester      varchar(255)                        null,
    user_agent     varchar(255)                        null,
    status         varchar(50)                         null,
    created_at     timestamp default CURRENT_TIMESTAMP null,
    modified_at    timestamp                           null
);

create table members
(
    id                bigint unsigned auto_increment
        primary key,
    uuid              varchar(255)                        not null,
    utm_uuid          varchar(255)                        not null,
    member_qr_code    varchar(255)                        not null,
    member_experience varchar(255)                        null,
    status            varchar(50)                         null,
    created_at        timestamp default CURRENT_TIMESTAMP not null,
    modified_at       timestamp                           null,
    constraint members_member_qr_code_uindex
        unique (member_qr_code),
    constraint members_uuid_uindex
        unique (uuid)
);

create table members_audit
(
    id                bigint unsigned auto_increment
        primary key,
    uuid              varchar(255)                        null,
    utm_uuid          varchar(255)                        null,
    member_qr_code    varchar(255)                        null,
    member_experience varchar(255)                        null,
    device_id         varchar(255)                        null,
    ip_address        varchar(255)                        null,
    request_id        varchar(255)                        null,
    request_type      varchar(50)                         null,
    requester         varchar(255)                        null,
    user_agent        varchar(255)                        null,
    status            varchar(50)                         null,
    created_at        timestamp default CURRENT_TIMESTAMP null,
    modified_at       timestamp                           null
);

create table user
(
    id            bigint unsigned auto_increment
        primary key,
    uuid          varchar(255)                        not null,
    first_name    varchar(255)                        not null,
    last_name     varchar(255)                        null,
    gender        varchar(50)                         null,
    user_country  varchar(255)                        null,
    user_currency varchar(255)                        null,
    onboard_date  timestamp                           null,
    onboard_city  varchar(255)                        null,
    active_city   varchar(255)                        null,
    lead_source   varchar(255)                        null,
    status        varchar(100)                        null,
    created_at    timestamp default CURRENT_TIMESTAMP not null,
    modified_at   timestamp                           null,
    constraint user_uuid_uindex
        unique (uuid)
);

create table user_audit
(
    id            bigint unsigned auto_increment
        primary key,
    uuid          varchar(255)                        null,
    first_name    varchar(255)                        null,
    last_name     varchar(255)                        null,
    gender        varchar(50)                         null,
    user_country  varchar(255)                        null,
    user_currency varchar(255)                        null,
    onboard_date  timestamp                           null,
    onboard_city  varchar(255)                        null,
    active_city   varchar(255)                        null,
    lead_source   varchar(255)                        null,
    device_id     varchar(255)                        null,
    ip_address    varchar(255)                        null,
    request_id    varchar(255)                        null,
    request_type  varchar(50)                         null,
    requester     varchar(255)                        null,
    user_agent    varchar(255)                        null,
    status        varchar(100)                        null,
    created_at    timestamp default CURRENT_TIMESTAMP null,
    modified_at   timestamp                           null
);

create table user_bank_details
(
    id                  bigint unsigned auto_increment
        primary key,
    uuid                varchar(255)                        not null,
    user_uuid           varchar(255)                        not null,
    bank_name           varchar(255) charset utf8           null,
    bank_ifsc           varchar(255)                        null,
    bank_account_number varchar(255)                        null,
    upi_address         varchar(255)                        null,
    status              varchar(50)                         null,
    created_at          timestamp default CURRENT_TIMESTAMP not null,
    modified_at         timestamp                           null,
    constraint user_bank_details_uuid_uindex
        unique (uuid)
);

create table user_bank_details_audit
(
    id                  bigint unsigned auto_increment
        primary key,
    uuid                varchar(255)                        null,
    user_uuid           varchar(255)                        null,
    bank_name           varchar(255) charset utf8           null,
    bank_ifsc           varchar(255)                        null,
    bank_account_number varchar(255)                        null,
    upi_address         varchar(255)                        null,
    device_id           varchar(255)                        null,
    ip_address          varchar(255)                        null,
    request_id          varchar(255)                        null,
    request_type        varchar(50)                         null,
    requester           varchar(255)                        null,
    user_agent          varchar(255)                        null,
    status              varchar(50)                         null,
    created_at          timestamp default CURRENT_TIMESTAMP null,
    modified_at         timestamp                           null
);

create table user_details
(
    id               bigint unsigned auto_increment
        primary key,
    uuid             varchar(255)                        not null,
    user_uuid        varchar(255)                        not null,
    address          varchar(255)                        null,
    alternate_mobile varchar(255)                        null,
    dob              varchar(255)                        null,
    display_pic_url  varchar(255)                        null,
    status           varchar(50)                         not null,
    created_at       timestamp default CURRENT_TIMESTAMP not null,
    modified_at      timestamp                           null,
    constraint user_details_uuid_uindex
        unique (uuid)
);

create table user_details_audit
(
    id               bigint unsigned auto_increment
        primary key,
    uuid             varchar(255)                        null,
    user_uuid        varchar(255)                        null,
    address          varchar(255)                        null,
    alternate_mobile varchar(255)                        null,
    dob              varchar(255)                        null,
    device_id        varchar(255)                        null,
    ip_address       varchar(255)                        null,
    request_id       varchar(255)                        null,
    request_type     varchar(50)                         null,
    requester        varchar(255)                        null,
    user_agent       varchar(255)                        null,
    status           varchar(50)                         null,
    created_at       timestamp default CURRENT_TIMESTAMP null,
    modified_at      timestamp                           null
);

create table user_identities
(
    id              bigint unsigned auto_increment
        primary key,
    uuid            varchar(255)                        not null,
    user_id         bigint unsigned                     not null,
    user_uuid       varchar(255)                        not null,
    tenant          varchar(255)                        not null,
    type            varchar(255)                        null,
    value           varchar(255)                        null,
    dialing_code    varchar(50)                         null,
    is_otp_verified tinyint(1)                          not null,
    is_primary      tinyint(1)                          not null,
    utmUUID         varchar(255)                        null,
    status          varchar(50)                         not null,
    created_at      timestamp default CURRENT_TIMESTAMP not null,
    modified_at     timestamp                           null,
    constraint user_identities_uuid_uindex
        unique (uuid)
);

create table user_identities_audit
(
    id              bigint unsigned auto_increment
        primary key,
    uuid            varchar(255)                        null,
    user_id         bigint unsigned                     null,
    user_uuid       varchar(255)                        null,
    tenant          varchar(255)                        null,
    type            varchar(255)                        null,
    value           varchar(255)                        null,
    dialing_code    varchar(50)                         null,
    is_otp_verified tinyint(1)                          null,
    is_primary      tinyint(1)                          null,
    device_id       varchar(255)                        null,
    ip_address      varchar(255)                        null,
    request_id      varchar(255)                        null,
    request_type    varchar(50)                         null,
    requester       varchar(255)                        null,
    user_agent      varchar(255)                        null,
    status          varchar(50)                         null,
    created_at      timestamp default CURRENT_TIMESTAMP null,
    modified_at     timestamp                           null
);

create table users_identities_verification
(
    id                         bigint unsigned auto_increment
        primary key,
    uuid                       varchar(255)                        not null,
    user_uuid                  varchar(255)                        not null,
    user_id                    bigint unsigned                     not null,
    tenant                     varchar(255)                        not null,
    type                       varchar(255)                        not null,
    value                      varchar(255)                        null,
    dialing_code               varchar(255)                        null,
    verification_type          varchar(255)                        not null,
    verification_token         varchar(255)                        null,
    verification_token_entered varchar(255)                        null,
    login_attempts             int                                 null,
    login_attempts_left        int                                 null,
    resend_attempts            int                                 null,
    resend_attempts_left       int                                 null,
    verification_attempts      int                                 null,
    verification_attempts_left int                                 null,
    is_otp_verified            tinyint(1)                          not null,
    is_primary                 tinyint(1)                          null,
    status                     varchar(50)                         not null,
    created_at                 timestamp default CURRENT_TIMESTAMP not null,
    modified_at                timestamp                           null,
    constraint users_identities_verification_uuid_uindex
        unique (uuid)
);

create table users_identities_verification_audit
(
    id                         bigint unsigned auto_increment
        primary key,
    uuid                       varchar(255)                        null,
    user_uuid                  varchar(255)                        null,
    user_id                    bigint unsigned                     null,
    tenant                     varchar(255)                        null,
    type                       varchar(255)                        null,
    value                      varchar(255)                        null,
    dialing_code               varchar(255)                        null,
    verification_type          varchar(255)                        null,
    verification_token         varchar(255)                        null,
    verification_token_entered varchar(255)                        null,
    login_attempts             int                                 null,
    login_attempts_left        int                                 null,
    resend_attempts            int                                 null,
    resend_attempts_left       int                                 null,
    verification_attempts      int                                 null,
    verification_attempts_left int                                 null,
    is_otp_verified            tinyint(1)                          null,
    is_primary                 tinyint(1)                          null,
    device_id                  varchar(255)                        null,
    ip_address                 varchar(255)                        null,
    request_id                 varchar(255)                        null,
    request_type               varchar(50)                         null,
    requester                  varchar(255)                        null,
    user_agent                 varchar(255)                        null,
    status                     varchar(50)                         null,
    created_at                 timestamp default CURRENT_TIMESTAMP null,
    modified_at                timestamp                           null
);

create table users_tenant_map
(
    id                    bigint unsigned auto_increment
        primary key,
    uuid                  varchar(255)                        not null,
    user_id               bigint unsigned                     not null,
    user_uuid             varchar(255)                        not null,
    tenant                varchar(255)                        not null,
    user_tags             json                                null,
    roles                 json                                null,
    verification_comments varchar(255)                        null,
    status                varchar(50)                         not null,
    created_at            timestamp default CURRENT_TIMESTAMP not null,
    modified_at           timestamp                           null,
    constraint users_tenant_map_uuid_uindex
        unique (uuid)
);

create table users_tenant_map_audit
(
    id                    bigint unsigned auto_increment
        primary key,
    uuid                  varchar(255)                        null,
    user_id               bigint unsigned                     null,
    user_uuid             varchar(255)                        null,
    tenant                varchar(255)                        null,
    user_tags             json                                null,
    roles                 json                                null,
    verification_comments varchar(255)                        null,
    device_id             varchar(255)                        null,
    ip_address            varchar(255)                        null,
    request_id            varchar(255)                        null,
    request_type          varchar(50)                         null,
    requester             varchar(255)                        null,
    user_agent            varchar(255)                        null,
    status                varchar(50)                         null,
    created_at            timestamp default CURRENT_TIMESTAMP null,
    modified_at           timestamp                           null
);

create table whitelist
(
    id           bigint unsigned auto_increment
        primary key,
    uuid         varchar(255)                        not null,
    email        varchar(255)                        not null,
    tenant       varchar(255)                        null,
    channel_id   varchar(255)                        not null,
    channel_type varchar(255)                        null,
    status       varchar(255)                        not null,
    created_at   timestamp default CURRENT_TIMESTAMP not null,
    modified_at  timestamp                           null,
    constraint whitelist_uuid_uindex
        unique (uuid)
);

create table jarvis.user_referral_info
(
    id                  bigint unsigned auto_increment
        primary key,
    uuid                varchar(255)                        null,
    user_uuid           varchar(255)                        null,
    utm_uuid            varchar(255)                        null,
    tenant              varchar(255)                        null,
    referring_user_uuid varchar(255)                        null,
    invite_code         varchar(255)                        null,
    app_version         varchar(255)                        null,
    app_type            varchar(255)                        null,
    device_id           varchar(255)                        null,
    ipAddress           varchar(255)                        null,
    status              varchar(255)                        null,
    created_at          timestamp default CURRENT_TIMESTAMP null,
    modified_at         timestamp                           null,
    constraint user_referral_info_uuid_uindex
        unique (uuid)
);
alter table jarvis.user_referral_info
    change ipAddress ip_address varchar(255) null;

create index user_identities_user_uuid_value_tenant_index
    on user_identities (user_uuid, value, tenant);

create index whitelist_email_index
    on whitelist (email);

create index users_tenant_map_user_uuid_tenant_index
    on users_tenant_map (user_uuid, tenant);

create index user_details_user_uuid_index
    on user_details (user_uuid);

alter table user
    add COLUMN user_name varchar(255) null after gender;

CREATE TABLE `user_waitlist_details_audit`
(
    `id`           bigint unsigned NOT NULL AUTO_INCREMENT,
    `uuid`         varchar(255)    NOT NULL,
    `first_name`   varchar(255)         DEFAULT NULL,
    `last_name`    varchar(255)         DEFAULT NULL,
    `phone`        varchar(255)         DEFAULT NULL,
    `dialing_code` varchar(10)          DEFAULT NULL,
    `email`        varchar(255)         DEFAULT NULL,
    `user_name`    varchar(255)         DEFAULT NULL,
    `device_id`    varchar(255)         DEFAULT NULL,
    `ip_address`   varchar(255)         DEFAULT NULL,
    `request_id`   varchar(255)         DEFAULT NULL,
    `request_type` varchar(50)          DEFAULT NULL,
    `requester`    varchar(255)         DEFAULT NULL,
    `user_agent`   varchar(255)         DEFAULT NULL,
    `status`       varchar(255)         DEFAULT NULL,
    `created_at`   timestamp       NULL DEFAULT NULL,
    `modified_at`  timestamp       NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `user_waitlist_details_uuid_uindex` (`uuid`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `user_waitlist_details`
(
    `id`           bigint unsigned NOT NULL AUTO_INCREMENT,
    `uuid`         varchar(255)    NOT NULL,
    `first_name`   varchar(255)         DEFAULT NULL,
    `last_name`    varchar(255)         DEFAULT NULL,
    `phone`        varchar(255)         DEFAULT NULL,
    `dialing_code` varchar(10)          DEFAULT NULL,
    `email`        varchar(255)         DEFAULT NULL,
    `user_name`    varchar(255)         DEFAULT NULL,
    `status`       varchar(255)         DEFAULT NULL,
    `created_at`   timestamp       NULL DEFAULT NULL,
    `modified_at`  timestamp       NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `user_waitlist_details_uuid_uindex` (`uuid`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `user_invite_map`
(
    `id`           bigint unsigned NOT NULL AUTO_INCREMENT,
    `uuid`         varchar(255)    NOT NULL,
    `invite_code`  varchar(255)        DEFAULT NULL,
    `utm_uuid`     varchar(255)        DEFAULT NULL,
    `tenant`       varchar(255)        DEFAULT NULL,
    `user_uuid`    varchar(255)        DEFAULT NULL,
    `cid`          varchar(255)        DEFAULT NULL,
    `channel_type` varchar(255)        DEFAULT NULL,
    `channel_id`   varchar(255)        DEFAULT NULL,
    `status`       varchar(50)         DEFAULT NULL,
    `created_at`   timestamp      NOT NULL,
    `modified_at`  timestamp      NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `user_invite_map_uuid_uindex` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

CREATE TABLE `user_invite_map_audit`
(
    `id`           bigint unsigned NOT NULL AUTO_INCREMENT,
    `uuid`         varchar(255)    NOT NULL,
    `invite_code`  varchar(255)        DEFAULT NULL,
    `utm_uuid`     varchar(255)        DEFAULT NULL,
    `tenant`       varchar(255)        DEFAULT NULL,
    `user_uuid`    varchar(255)        DEFAULT NULL,
    `cid`          varchar(255)        DEFAULT NULL,
    `channel_type` varchar(255)        DEFAULT NULL,
    `channel_id`   varchar(255)        DEFAULT NULL,
    `device_id`    varchar(255)         DEFAULT NULL,
    `ip_address`   varchar(255)         DEFAULT NULL,
    `request_id`   varchar(255)         DEFAULT NULL,
    `request_type` varchar(50)          DEFAULT NULL,
    `requester`    varchar(255)         DEFAULT NULL,
    `user_agent`   varchar(255)         DEFAULT NULL,
    `status`       varchar(255)         DEFAULT NULL,
    `created_at`   timestamp       NULL DEFAULT NULL,
    `modified_at`  timestamp       NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `user_invite_map_uuid_uindex` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

CREATE TABLE `user_referral_audit`
(
    `id`                  bigint       NOT NULL AUTO_INCREMENT,
    `created_at`          datetime     NOT NULL,
    `modified_at`         datetime     DEFAULT NULL,
    `status`              varchar(255) NOT NULL,
    `uuid`                varchar(255) NOT NULL,
    `device_id`           varchar(255) DEFAULT NULL,
    `ip_address`          varchar(255) DEFAULT NULL,
    `request_id`          varchar(255) DEFAULT NULL,
    `request_type`        varchar(255) NOT NULL,
    `requester`           varchar(255) NOT NULL,
    `user_agent`          varchar(255) DEFAULT NULL,
    `invite_code`         varchar(255) DEFAULT NULL,
    `referring_user_uuid` varchar(255) DEFAULT NULL,
    `tenant`              varchar(255) DEFAULT NULL,
    `user_uuid`           varchar(255) DEFAULT NULL,
    `utm_uuid`            varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

create table whitelist_audit
(
    id              bigint unsigned auto_increment
        primary key,
    uuid            varchar(255) NOT NULL,
    email           varchar(255) NOT NULL,
    tenant          varchar(255) NULL,
    channel_id      varchar(255) NOT NULL,
    channel_type    varchar(255) NULL,
    device_id       varchar(255) DEFAULT NULL,
    ip_address      varchar(255) DEFAULT NULL,
    request_id      varchar(255) DEFAULT NULL,
    request_type    varchar(50)  DEFAULT NULL,
    requester       varchar(255) DEFAULT NULL,
    user_agent      varchar(255) DEFAULT NULL,
    status          varchar(255) DEFAULT NULL,
    created_at      timestamp NULL DEFAULT NULL,
    modified_at     timestamp NULL DEFAULT NULL
);

CREATE TABLE `user_contacts`
(
    `id`            bigint       NOT NULL AUTO_INCREMENT,
    `created_at`    datetime     NOT NULL,
    `modified_at`   datetime     DEFAULT NULL,
    `status`        varchar(255) NOT NULL,
    `uuid`          varchar(255) NOT NULL,
    `contacts_data` json         DEFAULT NULL,
    `user_uuid`     varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `user_contacts_map`
(
    `id`                   bigint       NOT NULL AUTO_INCREMENT,
    `created_at`           datetime     NOT NULL,
    `modified_at`          datetime     DEFAULT NULL,
    `status`               varchar(255) NOT NULL,
    `uuid`                 varchar(255) NOT NULL,
    `contact_display_name` varchar(255) DEFAULT NULL,
    `contact_family_name`  varchar(255) DEFAULT NULL,
    `contact_given_name`   varchar(255) DEFAULT NULL,
    `contact_middle_name`  varchar(255) DEFAULT NULL,
    `contact_prefix`       varchar(255) DEFAULT NULL,
    `contact_suffix`       varchar(255) DEFAULT NULL,
    `user_uuid`            varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `user_contacts_map_contact_emails`
(
    `user_contacts_map_id` bigint NOT NULL,
    `contact_emails`       varchar(255) DEFAULT NULL,
    KEY `user_contacts_map_id` (`user_contacts_map_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `user_contacts_map_contact_phone_number`
(
    `user_contacts_map_id` bigint NOT NULL,
    `contact_phone_number` varchar(255) DEFAULT NULL,
    KEY `user_contacts_map_id` (`user_contacts_map_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

alter table jarvis.user_contacts_map_contact_emails
    add COLUMN id bigint unsigned AUTO_INCREMENT primary key NOT NULL FIRST,
    add COLUMN uuid varchar(255) default null after id,
    add COLUMN status varchar(255) default null,
    add COLUMN created_at datetime NOT NULL,
    add COLUMN modified_at datetime default null;

alter table jarvis.user_contacts_map_contact_phone_number
    add COLUMN id bigint unsigned AUTO_INCREMENT primary key NOT NULL FIRST,
    add COLUMN uuid varchar(255) default null after id,
    add COLUMN status varchar(255) default null,
    add COLUMN created_at datetime NOT NULL,
    add COLUMN modified_at datetime default null;

ALTER DATABASE jarvis CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

ALTER TABLE jarvis.countries CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.countries_audit CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.currencies CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.currencies_audit CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.currencies_countries_map CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.currencies_countries_map_audit CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.experts CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.experts_audit CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.members CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.members_audit CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.user CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.user_audit CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.user_bank_details CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.user_bank_details_audit CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.user_contacts CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.user_contacts_map CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.user_contacts_map_contact_emails CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.user_contacts_map_contact_phone_number CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.user_details CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.user_details_audit CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.user_identities CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.user_identities_audit CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.user_invite_map CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.user_invite_map_audit CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.user_referral_audit CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.user_referral_info CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.user_waitlist_details CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.user_waitlist_details_audit CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.users_identities_verification CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.users_identities_verification_audit CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.users_tenant_map CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.users_tenant_map_audit CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.whitelist CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
ALTER TABLE jarvis.whitelist_audit CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

alter table jarvis.user modify user_name longtext CHARSET utf8mb4;
SET collation_connection = utf8mb4_unicode_ci;

alter table user
    add COLUMN bio longtext CHARSET utf8mb4 null after user_name;