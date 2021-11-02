<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * BankAccounts
 *
 * @ORM\Table(name="bank_accounts", indexes={@ORM\Index(name="bank_id", columns={"bank_id"})})
 * @ORM\Entity
 */
class BankAccounts
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var string|null
     *
     * @ORM\Column(name="name", type="string", length=20, nullable=true)
     */
    private $name;

    /**
     * @var int
     *
     * @ORM\Column(name="balance", type="integer", nullable=false, options={"default"="10000"})
     */
    private $balance = 10000;

    /**
     * @var \Banks
     *
     * @ORM\ManyToOne(targetEntity="Banks")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="bank_id", referencedColumnName="bank_id")
     * })
     */
    private $bank;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(?string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getBalance(): ?int
    {
        return $this->balance;
    }

    public function setBalance(int $balance): self
    {
        $this->balance = $balance;

        return $this;
    }

    public function getBank(): ?Banks
    {
        return $this->bank;
    }

    public function setBank(?Banks $bank): self
    {
        $this->bank = $bank;

        return $this;
    }


}
