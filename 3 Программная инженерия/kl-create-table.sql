-- Таблица организаций (ОКПО)
CREATE TABLE Organizations (
    OrganizationID SERIAL PRIMARY KEY,
    OKPOCode VARCHAR(8) UNIQUE NOT NULL,
    Name VARCHAR(255) NOT NULL,
    RegistrationDate DATE,
    OrgType VARCHAR(100)
);

-- Таблица классификатора ОКВЭД 2
CREATE TABLE OKVED (
    OKVEDCode VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    ParentCode VARCHAR(10),
    CONSTRAINT fk_parent FOREIGN KEY (ParentCode) REFERENCES OKVED(OKVEDCode) ON DELETE SET NULL
);

-- Таблица связей между организациями и видами деятельности
CREATE TABLE OrganizationActivities (
    ID SERIAL PRIMARY KEY,
    OrganizationID INT NOT NULL REFERENCES Organizations(OrganizationID) ON DELETE CASCADE,
    OKVEDCode VARCHAR(10) NOT NULL REFERENCES OKVED(OKVEDCode) ON DELETE CASCADE,
    IsPrimary BOOLEAN DEFAULT FALSE
);

-- Создание индекса для ускорения поиска по связям
CREATE INDEX idx_org_activities_orgid ON OrganizationActivities(OrganizationID);
CREATE INDEX idx_org_activities_okved ON OrganizationActivities(OKVEDCode);
