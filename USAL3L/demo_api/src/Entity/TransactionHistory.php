<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use App\Repository\TransactionHistoryRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ApiResource(
 *  collectionOperations={"get"},
 *  itemOperations={"get"}
 * )
 * @ORM\Entity(repositoryClass=TransactionHistoryRepository::class)
 */
class TransactionHistory
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="datetime")
     */
    private $t_date;

    /**
     * @ORM\Column(type="decimal", precision=10, scale=2)
     */
    private $t_amount;

    /**
     * @ORM\Column(type="string", length=1)
     */
    private $t_type;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTDate(): ?\DateTimeInterface
    {
        return $this->t_date;
    }

    public function setTDate(\DateTimeInterface $t_date): self
    {
        $this->t_date = $t_date;

        return $this;
    }

    public function getTAmount(): ?string
    {
        return $this->t_amount;
    }

    public function setTAmount(string $t_amount): self
    {
        $this->t_amount = $t_amount;

        return $this;
    }

    public function getTType(): ?string
    {
        return $this->t_type;
    }

    public function setTType(string $t_type): self
    {
        $this->t_type = $t_type;

        return $this;
    }
}
