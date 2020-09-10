--liquibase formatted sql
--changeset llteam:TLL-001.16
INSERT INTO subscription.tenant_subscription_products VALUES (1, 1, 'Basic', 'prod_H4foVPeyDe6OsP', 'test-tenant-123');
INSERT INTO subscription.tenant_subscription_products VALUES (2, 2, 'Signature', 'prod_H2J8uLQ3P8McH4', 'test-tenant-123');
INSERT INTO subscription.tenant_subscription_products VALUES (3, 3, 'Premium', 'prod_H4fqYwFWCQR1oi', 'test-tenant-123');
INSERT INTO subscription.tenant_subscription_products VALUES (4, 1, 'Basic', 'prod_H4foVPeyDe6OsP', 'tenant-11-retail');
INSERT INTO subscription.tenant_subscription_products VALUES (5, 2, 'Signature', 'prod_H2J8uLQ3P8McH4', 'tenant-11-retail');
INSERT INTO subscription.tenant_subscription_products VALUES (6, 3, 'Premium', 'prod_H4fqYwFWCQR1oi', 'tenant-11-retail');



INSERT INTO subscription.tenant_coupons VALUES (1, true, 'repeating', 2, '10.0', '10_OFF', 'test-tenant-123');
INSERT INTO subscription.tenant_coupons VALUES (2, true, 'repeating', 6, '20.0', '20_OFF', 'test-tenant-123');
INSERT INTO subscription.tenant_coupons VALUES (3, true, 'repeating', 1, '30.0', '30_OFF', 'test-tenant-123');
INSERT INTO subscription.tenant_coupons VALUES (5, true, 'repeating', 2, '16', '16_OFF', 'test-tenant-123');
INSERT INTO subscription.tenant_coupons VALUES (6, true, 'repeating', 2, '15', '15_OFF', 'test-tenant-123');
INSERT INTO subscription.tenant_coupons VALUES (7, true, 'repeating', 1, '17.0', '17_OFF', 'test-tenant-123');
INSERT INTO subscription.tenant_coupons VALUES (8, true, 'repeating', 1, '17.0', '17_OFF', 'test-tenant-123');
INSERT INTO subscription.tenant_coupons VALUES (9, true, 'once', 0, '15.0', '25_OFF', 'test-tenant-123');
INSERT INTO subscription.tenant_coupons VALUES (10, true, 'repeating', 6, '20.0', '20_OFF', 'tenant-11-retail');
INSERT INTO subscription.tenant_coupons VALUES (67, true, 'repeating', 1, '17.0', '17_OFF', 'test-tenant-123');