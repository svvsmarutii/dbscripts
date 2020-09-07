INSERT INTO users.registration_states(state, state_desc) VALUES ('accountanalysis', 'Account analysis completed');
INSERT INTO users.registration_states(state, state_desc) VALUES ('accountoptimization', 'account optimization');
INSERT INTO users.registration_states(state, state_desc) VALUES ('cancelled', 'This is cancelled');
INSERT INTO users.registration_states(state, state_desc) VALUES ('registeredaccounts', 'This is registeredaccounts');
INSERT INTO users.registration_states(state, state_desc) VALUES ('riskanalyzed', 'This is riskanalyzed');
INSERT INTO users.registration_states(state, state_desc) VALUES ('signedup', 'Test signedup');
INSERT INTO users.registration_states(state, state_desc) VALUES ('subscription', 'Subscription is complete');
INSERT INTO users.registration_states(state, state_desc) VALUES ('unsubscribed', 'This is unsubscribed');

INSERT INTO users.tenant(tenant_id, cognito_userpool, name, created_date, description, active)VALUES ('tenant-11-retail','us-east-1_KrHINMq5U','leftlane-retail-tenant',now(),'This tenant is used to enroll retail users',true);
