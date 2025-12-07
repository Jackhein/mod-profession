SET @max_gold = 100000;

-- Repay character (by mail)
-- CAREFUL As we don't know the state of world server, we enter the price directly instead of looking world.npc_trainer.price value
-- Currently subject and body are both in French, I'll check the translation later, if I'm bored.
INSERT INTO mail (sender, receiver, subject, body, money)
SELECT
    0,
    cs.guid,
    "Remboursement fraude",
    "Suite à une analyse des finances de la guilde des Caligraphes,\nnous avons remarqué qu'un certain nombre de glyphes enseignés n'étaient pas certifié et avaient une valeur nulle.\nNous prions de bien vouloir nous excuser pour la gêne occasionné et vous trouverez ci-joint la somme trop percu par notre guilde lors de votre enseignement. Cordialement.",
    SUM(t.money)
    FROM character_spell cs
    JOIN (
        SELECT 57210 AS spell, 9500 AS money
        UNION ALL SELECT 57213, 14250
        UNION ALL SELECT 57216, 9500
        UNION ALL SELECT 57219, 9500
        UNION ALL SELECT 57221, 20000
        UNION ALL SELECT 57222, 30000
        UNION ALL SELECT 57224, 30000
        UNION ALL SELECT 57225, 50000
        UNION ALL SELECT 57226, 20000
        UNION ALL SELECT 57227, 30000
        UNION ALL SELECT 59338, 20000
        UNION ALL SELECT 59339, 20000
        UNION ALL SELECT 59340, 30000
        UNION ALL SELECT 64266, 10000
        UNION ALL SELECT 64267, 10000
) AS t(spell, money)
              ON cs.spell = t.spell
GROUP BY cs.guid
HAVING SUM(t.money) > 0;

-- Remove spells from characters
DELETE FROM character_spell
WHERE spell IN (57210, 57216, 64266, 57221, 57225, 57222, 57227, 59340, 57224, 59339, 59338, 57226, 57213, 64267, 57219)
DELETE FROM character_spell
WHERE spell IN (57230, 57215, 57229, 57228, 57214, 57209, 57217);

-- SELECT c.character_ID, cs.spell_ID, c.gold, nt.cost,
--        (c.gold + nt.cost) AS new_gold
-- FROM character_spells cs
--          JOIN characters c ON cs.character_ID = c.character_ID
--          JOIN npc_trainer nt ON cs.spell_ID = nt.spell_ID
-- WHERE cs.spell_ID IN (57230, 57215, 57229, 57228, 57209, 57217);