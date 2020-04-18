package eg.gov.iti.jets.repository.impl;

import eg.gov.iti.jets.model.ScratchCard;
import eg.gov.iti.jets.repository.ScratchCardRepository;

import java.util.Objects;

public class ScratchCardRepositoryImpl extends CrudImpl<ScratchCard, Long> implements ScratchCardRepository {
    private static ScratchCardRepositoryImpl instance;

    private ScratchCardRepositoryImpl() {
    }

    public static synchronized ScratchCardRepositoryImpl getInstance() {
        return instance = Objects.requireNonNullElseGet(instance, ScratchCardRepositoryImpl::new);
    }

    @Override
    public ScratchCard findByNumberAndValid(String cardNumber, Boolean valid) {
        return (ScratchCard) getEntityManager()
                .createNamedQuery("ScratchCard.findByNumberAndValid")
                .setParameter("cardNumber", cardNumber)
                .setParameter("valid", valid).getSingleResult();
    }
}

