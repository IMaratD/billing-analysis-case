-- Mock data for billing analysis case

-- Partners

INSERT INTO partners (
    partner_id,
    partner_role,
    partner_mode,
    parent_partner_id
)
VALUES
(1, 'distributor', 'direct', NULL),
(2, 'reseller', 'direct', 1),
(3, 'distributor', 'whitelabel', NULL),
(4, 'reseller', 'whitelabel', 3),
(5, 'reseller', 'direct', NULL),
(6, 'reseller', 'integrated', NULL);


-- Users

INSERT INTO users (
    user_id,
    partner_id,
    account_type
)
VALUES
(101, NULL, 'direct'),
(102, 2, 'partner'),
(103, 3, 'partner'),
(104, 4, 'partner'),
(105, 5, 'partner'),
(106, 6, 'partner');