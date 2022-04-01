<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * TransactionHistory
 *
 * @ORM\Table(name="transaction_history", indexes={@ORM\Index(name="t_account_id", columns={"t_account_id"})})
 * @ORM\Entity
 */
class TransactionHistory
{
    /**
     * @var int
     *
     * @ORM\Column(name="t_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $tId;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="t_date", type="datetime", nullable=false)
     */
    private $tDate;

    /**
     * @var string|null
     *
     * @ORM\Column(name="t_amount", type="decimal", precision=10, scale=2, nullable=true)
     */
    private $tAmount;

    /**
     * @var string|null
     *
     * @ORM\Column(name="t_type", type="string", length=1, nullable=true, options={"fixed"=true})
     */
    private $tType;

    /**
     * @var \BankAccounts
     *
     * @ORM\ManyToOne(targetEntity="BankAccounts")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="t_account_id", referencedColumnName="id")
     * })
     */
    private $tAccount;

    public function getTId(): ?int
    {
        return $this->tId;
    }

    public function getTDate(): ?\DateTimeInterface
    {
        return $this->tDate;
    }

    public function setTDate(\DateTimeInterface $tDate): self
    {
        $this->tDate = $tDate;

        return $this;
    }

    public function getTAmount(): ?string
    {
        return $this->tAmount;
    }

    public function setTAmount(?string $tAmount): self
    {
        $this->tAmount = $tAmount;

        return $this;
    }

    public function getTType(): ?string
    {
        return $this->tType;
    }

    public function setTType(?string $tType): self
    {
        $this->tType = $tType;

        return $this;
    }

    public function getTAccount(): ?BankAccounts
    {
        return $this->tAccount;
    }

    public function setTAccount(?BankAccounts $tAccount): self
    {
        $this->tAccount = $tAccount;

        return $this;
    }


}
