<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use ApiPlatform\Core\Annotation\ApiResource;

/**
 * Banks
 * 
 * @ApiResource()
 * 
 * @ORM\Table(name="banks")
 * @ORM\Entity
 */
class Banks
{
    /**
     * @var int
     *
     * @ORM\Column(name="bank_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $bankId;

    /**
     * @var string|null
     *
     * @ORM\Column(name="bank_name", type="string", length=20, nullable=true)
     */
    private $bankName;

    /**
     * @var int
     *
     * @ORM\Column(name="bank_balance", type="integer", nullable=false, options={"default"="100000000"})
     */
    private $bankBalance = 100000000;

    public function getBankId(): ?int
    {
        return $this->bankId;
    }

    public function getBankName(): ?string
    {
        return $this->bankName;
    }

    public function setBankName(?string $bankName): self
    {
        $this->bankName = $bankName;

        return $this;
    }

    public function getBankBalance(): ?int
    {
        return $this->bankBalance;
    }

    public function setBankBalance(int $bankBalance): self
    {
        $this->bankBalance = $bankBalance;

        return $this;
    }


}
