<?php

namespace App\Entity;

use Symfony\Component\Serializer\Annotation\Groups;
use ApiPlatform\Core\Annotation\ApiResource;
use App\Repository\BankRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ApiResource(
 *  normalizationContext={"groups"={"bank:read"}},
 *  denormalizationContext={"groups"={"bank:write"}}
 * )
 * @ORM\Entity(repositoryClass=BankRepository::class)
 */
class Bank
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     * 
     * @Groups({"bank:read"})
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=20)
     * 
     * @Groups({"bank:read", "bank:write"})
     */
    private $bank_name;

    /**
     * @ORM\Column(type="integer")
     * 
     * @Groups({"bank:read"})
     */
    private $bank_balance;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getBankName(): ?string
    {
        return $this->bank_name;
    }

    public function setBankName(string $bank_name): self
    {
        $this->bank_name = $bank_name;

        return $this;
    }

    public function getBankBalance(): ?int
    {
        return $this->bank_balance;
    }

    public function setBankBalance(int $bank_balance): self
    {
        $this->bank_balance = $bank_balance;

        return $this;
    }
}
